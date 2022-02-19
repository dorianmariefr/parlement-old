class RelationPolicy < ApplicationPolicy
  def index?
    user?
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

  class Scope < Scope
    def resolve
      if user?
        base_scope.where(from: policy_scope(Person)).or(
          base_scope.where(to: policy_scope(Person))
        )
      else
        base_scope.none
      end
    end

    def base_scope
      scope.joins(:from, :to)
    end
  end
end
