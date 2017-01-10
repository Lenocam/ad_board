class Gallery < ApplicationRecord
  belongs_to :user
  validates :user, presence: true
  validates :title, presence: true, uniqueness: { scope: :user_id }
  validates :title, presence: true, length: { minimum: 3, maximum: 40 }

  has_many   :gallery_images, dependent: :destroy
  has_many   :images, through: :gallery_images

  has_many   :category_galleries, dependent: :destroy
  has_many   :categories, through: :category_galleries
end
