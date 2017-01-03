class GalleryPolicy < ApplicationPolicy
  attr_reader :user, :model

  def initialize(user, model)
    @user = user
    @gallery = model
  end

  class Scope < Scope
    def resolve
        scope.where(:user_id == user.id)
    end
  end

  def show?
    @gallery.user == @user || @user.admin?
  end

  def new?
    true
  end
end
