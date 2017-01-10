class CreateGalleryImages < ActiveRecord::Migration[5.0]
  def change
    create_table :gallery_images do |t|
      t.references :gallery, foreign_key: true
      t.references :image, foreign_key: true

      t.timestamps
    end
  end
end
