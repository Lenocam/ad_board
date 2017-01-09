class ApplicationPolicy
  attr_reader :current_user, :record


  def initialize(current_user, record)
    raise Pundit::NotAuthorizedError, "must be logged in" unless current_user
    @current_user = current_user
    @record = record
  end

  def index?
    false
  end

  def show?
    false
  end

  def create?
    true
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  class Scope
    attr_reader :current_user, :scope

    def initialize(current_user, scope)
      @current_user = current_user
      @scope = scope
    end

    def resolve
      scope.where(current_user_id: scope.current_user.id)
    end
  end
end
