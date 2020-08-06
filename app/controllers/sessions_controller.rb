class SessionsController < ApplicationController
  include Secured

  layout "welcome"

   skip_before_action :authorized, :only => [:new, :create, :github, :welcome]

  def new
    @user = User.new
  end

  def github
    @user = User.find_by_email(auth_hash.info.email)
    debugger
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

  protected

  def user_params
  params.require(:user).permit(:name, :email, :location, :password, :password_confirmation)
  end

  def authorized
     return head(:forbidden) unless session.include? :user_id
  end

  def auth_hash
    request.env['omniauth.auth']
  end

end
