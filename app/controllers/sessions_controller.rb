class SessionsController < ApplicationController
  include Secured

  layout "welcome"
  skip_forgery_protection :only => [:google_auth]
  skip_before_action :require_login, :only => [:new, :create, :google_auth, :welcome]
  skip_before_action :set_vars, :only => [:new, :create, :google_auth, :welcome]


  def new
    @user = User.new
  end

  def google_auth
    @user = User.find_or_create_by_omniauth(auth_hash)
    if @user
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:notice] = "Please sign up no record found"
      render 'users/new'
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
