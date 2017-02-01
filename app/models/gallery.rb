class Gallery < ApplicationRecord
  belongs_to :user
  validates :user, presence: true
  validates :title, presence: true, uniqueness: { scope: :user_id }
  validates :title, presence: true, length: { minimum: 3, maximum: 30 }

  has_many   :category_galleries, dependent: :destroy
  has_many   :categories, through: :category_galleries

  def categories_images
    categories.flat_map(&:images).uniq
  end

  def now
    view = []
    categories_images.select do |image|
      if image[:start_at] && image[:start_at] < DateTime.now
        view << image if image[:end_at].nil? || image[:end_at] > DateTime.now
      end
    end
  end
end
