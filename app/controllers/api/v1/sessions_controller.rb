module Api
  module V1
    class SessionsController < Api::V1::BaseController
      skip_before_action :require_login!, only: [:create]

      def create
        resource = User.find_for_database_authentication(:email => params[:user_login][:email])
        return invalid_login_attempt unless resource

        if resource.valid_password?(params[:user_login][:password])
          auth_token = resource.generate_auth_token
          render json: { auth_token: auth_token }
        else
          invalid_login_attempt
        end
      end

      def destroy
        resource = current_user
        resource.invalidate_auth_token
        head :ok
      end

      private
        def invalid_login_attempt
          render json: { errors: [ { detail:"Error with you login or password"}]}, status: 401
        end
    end
  end
end
