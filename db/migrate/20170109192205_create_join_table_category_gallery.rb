class CreateJoinTableCategoryGallery < ActiveRecord::Migration[5.0]
  def change
    def change
      create_join_table :categories, :categories do |t|
        t.index [:category_id, :image_id]
        t.index [:image_id, :category_id]
      end
    end
  end
end
