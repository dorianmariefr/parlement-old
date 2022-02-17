class ApplicationController < ActionController::Base
  include Pundit::Authorization

  helper_method :current_user
  helper_method :can?

  private

  def current_user
    return if session[:user_id].blank?
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def can?(action, record)
    policy(record).public_send(action)
  end
end
