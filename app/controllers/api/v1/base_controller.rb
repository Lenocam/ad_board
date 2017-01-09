module Api
  module V1
    class BaseController < ActionController::Base
      protect_from_forgery with: :null_session, :if => Proc.new { |c| c.request.format == 'application/json' }
      before_action :require_login!, except: [:create]
      helper_method :person_signed_in?, :current_user

      def user_signed_in?
        current_person.present?
      end

      def require_login!
        return true if authenticate_token
        render json: { errors: [ { detail: "Access denied" } ] }, status: 401
      end

      def current_user
        @_current_user ||= authenticate_token
      end

      private
        def authenticate_token
          authenticate_with_http_token do |token, options|
            User.find_by(auth_token: token)
          end
        end

        def render_error(resource, status)
          render json: resource, status: status, adapter: :json_api,
          serializer: ActiveModel::Serializer::ErrorSerializer

        end
    end
  end
end
