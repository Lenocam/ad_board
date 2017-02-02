class ImagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_image, only: [:show, :edit, :update, :destroy]
  respond_to :js

  def index
    @images = current_user.images.all
  end

  def show
    @categories = current_user.categories.all
  end

  def new
    @image = current_user.images.build
  end

  def edit
  end

  def create
    @image = current_user.images.create(image_params)
    redirect_to user_images_url(current_user), notice: "Your Image has been added"
  end

  def update
  @image.update(image_params)
    respond_to do |f|
      f.html { redirect_to images_url }
      f.js
    end
    redirect_to user_images_url(current_user), notice: 'Image Updated'
  end

  def delete
    @image = Image.find(params[:image_id])
  end

  def destroy
    @image = Image.destroy(params[:id])
    respond_to do |f|
      f.html { redirect_to images_url }
      f.js
    end
    redirect_to user_images_url(current_user), notice: 'Image was successfully destroyed.'
  end

  private

  def set_image
    @image = Image.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def image_params
    allowed = params.require(:image).permit(:file, :start_at, :end_at, category_ids: [])

    # Call to Create New Categories on update/new action of images
    allowed[:category_ids] = clean_up_categories(allowed[:category_ids])
    allowed
  end

  def clean_up_categories(categories)
    valid_ids = []
    categories.each do |cat|
      next if cat.blank?
      if Category.where(id: cat).any?
        valid_ids << cat
      else
        new_cat = current_user.categories.create(name: cat)
        valid_ids << new_cat.id
      end
    end
    valid_ids
  end
end
