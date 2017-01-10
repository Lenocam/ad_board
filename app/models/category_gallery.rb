class CategoryGallery < ApplicationRecord
  belongs_to :category
  belongs_to :gallery
end
