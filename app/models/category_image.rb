class CategoryImage < ActiveRecord::Base
	belongs_to :image
	belongs_to :category
end
