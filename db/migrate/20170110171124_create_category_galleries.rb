class CreateCategoryGalleries < ActiveRecord::Migration[5.0]
  def change
    create_table :category_galleries do |t|
      t.references :category, foreign_key: true
      t.references :gallery, foreign_key: true

      t.timestamps
    end
  end
end
