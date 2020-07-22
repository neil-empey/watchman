class SessionsController < ApplicationController
  include ApplicationHelper

  layout "welcome"

  # skip_before_action :authorized, only: [:new, :create, :github]

  def new
    @user = User.new
  end

  def github
    auth = session[:userinfo]
     @user = User.find_or_create_by(email: auth['info']['email']) do |u|
         u.password = callback['uid']
     end
     session[:user_id] = @user.id

     redirect_to user_path(@user)
 end

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:error] = "Invalid credentials. Please check your name and password."
      redirect_to 'signin'
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

  def authorized
     return head(:forbidden) unless session.include? :user_id
  end

end
