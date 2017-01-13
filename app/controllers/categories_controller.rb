class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :all_categories, only: [:index, :create, :update, :destroy]
  respond_to :html, :js

  def new
    @category = current_user.categories.build
  end

  def create
    @category = current_user.categories.create(category_params)
    @category.save!
  end

  def update
    @category.update(category_params)
  end

  def destroy
    @category.destroy
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, gallery_ids: [])
  end

  def all_categories
    @categories = current_user.categories.all
  end
end
