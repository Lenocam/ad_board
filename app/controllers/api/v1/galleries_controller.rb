module Api
  module V1
    class GalleriesController < Api::V1::BaseController

      def show
        @gallery = Gallery.find(params[:id])
      end
    end
  end
end
