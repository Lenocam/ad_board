class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActionController::RedirectBackError, with: :redirect_back_exception
  rescue_from ActionView::MissingTemplate, with: :redirect_missing_template
  #rescue_from ActionController::RoutingError, with: :record_not_found



  private
    def user_not_authorized
      flash[:alert] = "Access denied. You are not authorized to enter"
      redirect_to (request.referrer || root_path)
    end

    def record_not_found
      flash[:alert] = "With all humble and due apologies, Record Not Found"
      redirect_to user_galleries_path(current_user)
    end

    def redirect_back_exception
        flash[:alert] = "Back exception error, I take exception to your back!"
      redirect_to root_path
    end

    def redirect_missing_template
        flash[:alert] = "Missing Template Error, I'm not sure what that is either"
      redirect_to root_path
    end

    #def routing_error
    #  flash[:alert] = "You have experienced a routing error. Find some direction"
    #  raise ActionController::RoutingError.new(params[:path])
    #end
end
