class RemoveGalleryImageTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :gallery_images
  end
end
