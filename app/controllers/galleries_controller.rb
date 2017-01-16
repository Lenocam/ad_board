class GalleriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_gallery, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized, except: :index
  #after_action :verify_policy_scoped, only: :index

  def index
    #@galleries = policy_scope(Gallery)
    @galleries = current_user.galleries.all
  end

  def new
    @gallery = current_user.galleries.build #Gallery.new
    authorize @gallery
  end

  def create
    @gallery = current_user.galleries.build(gallery_params)
    authorize @gallery
    if @gallery.save
      flash[:notice] = "Your gallery was successfully created."
      redirect_to @gallery
    else
      flash[:alert] = "Your gallery must have a unique title."
      render :new
    end
  end

  def edit
    authorize @gallery
  end

  def update

    if @gallery.update(gallery_params)
      authorize @gallery
      flash[:notice] = 'Gallery Updated'
      redirect_to @gallery

    end
  end

  def show
    @gallery_images = @gallery.categories_images
    authorize @gallery
    #@gallery_now = @gallery.now
    @categories = current_user.categories.all
    #respond_with(@categories)
  end

  def destroy
    @gallery.destroy
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
end
