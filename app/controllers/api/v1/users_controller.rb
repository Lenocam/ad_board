module Api
  module V1
    class UsersController < Api::V1::BaseController
      before_action :set_user, only: [:show, :update, :destroy]
      before_action :check_header
      before_action :validate_type, only: [:create, :update]
      #I don't think I need this one, for at least create
      #before_action :validate_user, only: [:create, :update, :destroy]

      def index
        if current_user.admin?
          @users = User.all
          render json: @users
        else
          render json: { message: "Access denied. You are not authorized to enter" }
        end
      end

      def show
        if @user == current_user || current_user.admin?
          render json: @user
        else
          render json: { message: "Access denied. You are not authorized to enter" }
        end
      end

      def create
        @user = User.new(user_params)
        if @user.save
          render json: @user, status: :created
        else
          render_error(@user, :unprocessable_entity)
        end
      end

  private

    def user_params
      ActiveModelSerializers::Deserialization.jsonapi_parse(params)
    end

    def set_user
      begin
        @user = User.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        user = User.new
        user.errors.add(:id, "Wrong ID provided")
        render_error(user, 404) and return
      end
    end

    def check_header
      if ['POST','PUT','PATCH'].include? request.method
        if request.content_type != "application/vnd.api+json"
          head 406 and return
        end
      end
    end

    def render_error(resource, status)
      render json: resource, status: status, adapter: :json_api,
             serializer: ActiveModel::Serializer::ErrorSerializer
    end

    def validate_type
      if params['data'] && params['data']['type']
        if "api/v1/" + params['data']['type'] == params[:controller]
          return true
        end
      end
      head 409 and return
    end
=begin
    def validate_user
      token = request.headers["X-Api-Key"]
      head 403 and return unless token
      @user = User.find_by auth_token: token
      head 403 and return unless @user
    end
=end
    end
  end
end
