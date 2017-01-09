module Api
  module V1
    class GalleriesController < Api::V1::BaseController

      def show
        @gallery = Gallery.find(params[:id])
        if @gallery.user == current_user || current_user.admin?
          render json: @gallery
        else
          render json: { message: "Access denied. You are not authorized to enter" }
        end
      end

      def new
        @gallery = current_user.galleries.build

      end

      def create
        @gallery = Gallery.new(gallery_params)
        if @gallery.save
          render json: @gallery, status: 201
        else
          render json: @gallery.errors, status: :unprocessable_entity
        end

      end

      private
      def gallery_params
        ActiveModelSerializers::Deserialization.jsonapi_parse(params)
      end
    end
  end
end
