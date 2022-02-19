# frozen_string_literal: true
class ApplicationPolicy
  include Pundit::Authorization

  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  class Scope
    include Pundit::Authorization

    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def user?
      !!user
    end

    def current_user
      user
    end
  end

  private

  def user?
    !!user
  end

  def current_user
    user
  end
end
