class Image < ApplicationRecord
  belongs_to :user
  mount_base64_uploader :file, FileUploader, file_name: -> { "file-#{DateTime.now.to_i}" }
  validates :file, presence: true

  has_many :categories, through: :category_images
  has_many :category_images, dependent: :destroy
end
