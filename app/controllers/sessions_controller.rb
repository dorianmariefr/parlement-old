class SessionsController < ApplicationController
  before_action :authorize_session

  def new
  end

  def create
    @user = User.find_by(name: session_params[:name])

    if @user&.authenticate(session_params[:password])
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Logged in"
    elsif @user
      flash.now.alert = "Wrong password"
      render :new, status: :unprocessable_entity
    else
      flash.now.alert = "User not found"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil

    redirect_to root_path, notice: "Logged out"
  end

  private

  def authorize_session
    authorize :session
  end

  def session_params
    params.require(:session).permit(:name, :password)
  end
end
