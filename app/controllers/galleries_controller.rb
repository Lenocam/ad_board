class GalleriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_gallery, only: [:show, :edit, :update, :destroy]
  before_action :all_galleries, only: [:index, :create, :update, :destroy]
  before_action :all_images
  after_action :verify_authorized, except: :index
  #after_action :verify_policy_scoped, only: :index
  respond_to :js

  def index
    @galleries = current_user.galleries.order(updated_at: :desc)
    #@galleries = policy_scope(Gallery)
    #@gallery_images = @gallery.categories_images
  end

  def new
    @gallery = current_user.galleries.build
    authorize @gallery
  end

  def create
    @gallery = current_user.galleries.create(gallery_params)
    authorize @gallery
  end

  def edit
    authorize @gallery
  end

  def update
    @gallery.update(gallery_params)
    respond_to do |f|
      f.html { redirect_to galleries_url }
      f.js
    end
    redirect_to user_galleries_url(current_user), notice: 'Gallery Updated'
    authorize @gallery
  end

  def show
    @gallery_images = @gallery.categories_images
    authorize @gallery
    #@gallery_now = @gallery.now
    @categories = current_user.categories.all
    #respond_with(@categories)
  end

  def delete
    @gallery = Gallery.find(params[:gallery_id])
    authorize @gallery
  end

  def destroy
    @gallery = Gallery.destroy(params[:id])
    respond_to do |f|
      f.html { redirect_to galleries_url }
      f.js
    end
    authorize @gallery
    redirect_to user_galleries_url(current_user), notice: 'Gallery was successfully destroyed.'
  end

  private
    def set_gallery
      @gallery = Gallery.find(params[:id])
    end

    def gallery_params
      allowed = params.require(:gallery).permit(:title, category_ids: [])
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

  def all_galleries
    @galleries = current_user.galleries.all
  end

  def all_images
    @images = current_user.images.all
  end
end
