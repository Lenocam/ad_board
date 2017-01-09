module Api
  module V1
    class ImagesController < Api::V1::BaseController
      before_action :set_image, only: [:show, :edit, :update, :destroy]
      respond_to :json

      def index
        @images = current_user.images.all
      end

      def new
        @image = current_user.images.build
      end
      def create
        @image = Image.new(image_params)
        if @image.save
          render json: @image, status: 201
        else
          render json: @image.errors, status: :unprocessable_entity
        end

      end


      def show
        if @image.user == current_user || current_user.admin?
          render json: @image
        else
          render json: { message: "Access denied. You are not authorized to enter" }
        end
      end

      private

        # Use callbacks to share common setup or constraints between actions.
        def set_image
          @image = Image.find(params[:id])
        end

        def image_params
          ActiveModelSerializers::Deserialization.jsonapi_parse(params)
        end
    end
  end
end
