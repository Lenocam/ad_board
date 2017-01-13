class UsersController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized, :except => :index
  before_action :set_user, only: [:show, :edit, :update, :destroy, :show_galleries]

  def index
    @users = User.all
    authorize User
  end

  def show

    authorize @user
  end

  def destroy
    authorize @user
    @user.destroy
    redirect_to users_path, :notice => "User deleted"
  end
  def edit
    authorize @user
  end

  def update
    authorize @user
    if @user.update_attributes(secure_params)
      redirect_to users_path, :success => "User updated"
    else
      redirect_to users_path, :alert => "Unable to update"
    end
  end

  def show_galleries
    @galleries = @user.galleries
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def secure_params
      params.require(:user).permit(:role)
    end

end
