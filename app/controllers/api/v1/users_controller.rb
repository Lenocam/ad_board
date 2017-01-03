module Api
  module V1
    class UsersController < Api::V1::BaseController
      def show
        @user = User.find(params[:id])
        render json: @user #, serializer: UserSerializer
        #render(json: Api::V1::UserSerializer.new(@user).to_json)
      end
    end
  end
end
