class UserPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def new?
    create?
  end

  def create?
    !user?
  end

  def edit?
    update?
  end

  def update?
    self?
  end

  def destroy?
    self?
  end

  class Scope < Scope
    def resolve
      scope
    end
  end

  private

  def self?
    user? && user == record
  end
end
