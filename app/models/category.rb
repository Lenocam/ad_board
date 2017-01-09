class Category < ApplicationRecord
  belongs_to :user
  validates  :user_id, presence: true

  has_many   :images, through: :category_images
  has_many   :category_images, dependent: :destroy

  has_many   :galleries, through: :category_galleries
  has_many   :category_galleries, dependent: :destroy

  validates  :name, presence: true, length: { minimum: 3, maximum: 25 }
  validates_uniqueness_of :name, scope: :user_id
end
