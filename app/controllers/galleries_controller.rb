class GalleriesController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index

  def index
    @galleries = policy_scope(Gallery)
    #@galleries = current_user.galleries.all
  end

  def new
    @gallery = current_user.galleries.build #Gallery.new
    authorize @gallery
  end

  def create
    @gallery = current_user.galleries.build(gallery_params)
    authorize @gallery
    if @gallery.save
      flash[:success] = "Your gallery was successfully created."
      redirect_to @gallery
    else
      flash[:alert] = "Your gallery must have a unique title."
      render :new
    end
  end

  def show
    @gallery = Gallery.find(params[:id])
    authorize @gallery
  end

  private
    def gallery_params
      params.require(:gallery).permit(:title)
    end
end
