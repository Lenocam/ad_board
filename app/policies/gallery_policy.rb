class GalleryPolicy < ApplicationPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @gallery = model
  end

  class Scope < Scope
    def resolve
        scope.where(:current_user_id == current_user.id)
    end
  end

  def show?
    @gallery.user == @current_user || @current_user.admin?
  end

  def new?
    true
  end
end
