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
    end
  end
end
