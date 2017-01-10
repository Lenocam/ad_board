class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]


# GET /images
  # GET /images.json
  def index
    @images = current_user.images.all
  end

  # GET /images/1
  # GET /images/1.json
  def show
  end

  # GET /images/new
  def new
    @image = current_user.images.build
  end

  # GET /images/1/edit
  def edit
  end

  # POST /images
  # POST /images.json
  def create
    @image = current_user.images.build(image_params)
      if @image.save!
        redirect_to @image
      else
        render :new
      end

  end

  # PATCH/PUT /images/1
  # PATCH/PUT /images/1.json
  def update
    if @image.update(image_params)
      redirect_to @image, notice: 'Image was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    @image.destroy
    redirect_to user_images_url(current_user), notice: 'Image was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_image
    @image = Image.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def image_params
    params.require(:image).permit(:file, :start_at, :end_at, category_ids: [])
  end
end
