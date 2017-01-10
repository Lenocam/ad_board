class GalleryImage < ApplicationRecord
  belongs_to :gallery
  belongs_to :image
end
