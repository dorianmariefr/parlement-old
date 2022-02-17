class PagesController < ApplicationController
  def index
    return if current_user

    @user = User.new
  end
end
