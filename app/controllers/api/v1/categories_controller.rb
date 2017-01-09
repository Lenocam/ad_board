module Api
  module V1
    class CategoriesController < Api::V1::BaseController

      def show
        @category = category.find(params[:id])
        if @category.user == current_user || current_user.admin?
          render json: @category
        else
          render json: { message: "Access denied. You are not authorized to enter" }
        end
      end

      def new
        @category = current_user.categories.build
      end

      def create
        @category = Category.new(category_params)
        if @category.save
          render json: @category, status: 201
        else
          render json: @category.errors, status: :unprocessable_entity
        end

      end

      private
      def category_params
        ActiveModelSerializers::Deserialization.jsonapi_parse(params)
      end
    end
  end
end
