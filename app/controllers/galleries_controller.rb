class GalleriesController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized, :except => :index
  after_action :verify_policy_scoped, :only => :index


  def index
    @galleries = policy_scope(Gallery)
    #@galleries = current_user.galleries.all
  end

  def new
    @gallery = Gallery.new #current_user.galleries.build
    authorize @gallery
  end

  def create
    @gallery = current_user.galleries.build(gallery_params)
    respond_to do |format|
      if @gallery.save
          format.html { redirect_to @gallery, success: "Gallery was successfully created." }
          format.json { render :show, status: :created, location: @gallery }
      else
        format.html { render :new, alert: "There was a problem" }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
      end
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
