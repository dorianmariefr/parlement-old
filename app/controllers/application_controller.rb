class ApplicationController < ActionController::Base
  include Pundit::Authorization

  helper_method :current_user
  helper_method :can?

  rescue_from Pundit::NotAuthorizedError do |e|
    redirect_to root_path, alert: e
  end

  private

  def current_user
    return if session[:user_id].blank?
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def can?(action, record)
    policy(record).public_send(action)
  end
end
