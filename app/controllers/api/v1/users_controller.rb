module Api
  module V1
    class UsersController < Api::V1::BaseController
      #before_action :require_login!
      def show
        @user = User.find(params[:id])
        if @user == current_user || current_user.admin?
          render json: @user
        else
          render json: { message: "Access denied. You are not authorized to enter" }
        end
      end
    end
  end
end
