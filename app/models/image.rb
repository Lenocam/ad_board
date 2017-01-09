class Image < ApplicationRecord
  belongs_to :user
  mount_base64_uploader :file, FileUploader, file_name: -> { "file-#{DateTime.now.to_i}" }
  #validates :file, presence: true
end
