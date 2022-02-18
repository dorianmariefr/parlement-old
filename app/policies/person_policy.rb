class PersonPolicy < ApplicationPolicy
  def index?
    user? && owner?
  end

  def show?
    user? && owner?
  end

  def new?
    create?
  end

  def create?
    user?
  end

  def edit?
    update?
  end

  def update?
    user? && owner?
  end

  def destroy?
    user? && owner?
  end

  class Scope < Scope
    def resolve
      if user?
        scope.where(user: user)
      else
        scope.none
      end
    end
  end

  private

  def owner?
    user? && record.user && user == record.user
  end
end
