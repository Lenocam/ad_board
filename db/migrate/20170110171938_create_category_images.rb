class CreateCategoryImages < ActiveRecord::Migration[5.0]
  def change
    create_table :category_images do |t|
      t.references :category, foreign_key: true
      t.references :image, foreign_key: true

      t.timestamps
    end
  end
end
