class CreateJoinTableCategoryImage < ActiveRecord::Migration[5.0]
  def change
    create_join_table :categories, :images do |t|
      t.index [:category_id, :image_id]
      t.index [:image_id, :category_id]
    end
  end
end
