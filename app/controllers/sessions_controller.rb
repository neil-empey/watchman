class SessionsController < ApplicationController
  include Secured

  layout "welcome"
  skip_before_action :authorized, :only => [:new, :create, :github]
  skip_before_action :require_login, :only => [:new, :create, :github]
  skip_before_action :set_vars, :only => [:new, :create, :github]

  def new
    @user = User.new
  end

  def github
    @user = User.find_by_email(auth_hash.info.email)
    if @user
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:alert] = "Invalid credentials. Please check your email and password."
      redirect_to '/'
    end
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:alert] = "Invalid credentials. Please check your name and password."
      redirect_to '/'
    end
  end

  def destroy
    session.clear
    flash[:notice] = "logged out"
    redirect_to '/'
  end

  private

  def user_params
  params.require(:user).permit(:name, :email, :location, :password, :password_confirmation)
  end

  def auth_hash
    request.env['omniauth.auth']
  end

  def require_login
  redirect_to :root_path, notice: "Please log in or sign up" unless current_user
  end

end
