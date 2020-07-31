class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if User.find_by_email(user_params[:email]) == nil
    @user = User.new(user_params)
     if Neighborhood.find_by_id(user_params[:location]) == nil
       @new_hood = Neighborhood.new(location: @user.location)
       @new_hood.id = @new_hood.location
       @new_hood.save
       @user.neighborhood_id = @user.location
       @user.save
     else
       @hood = Neighborhood.find(@user.location)
       @user.neighborhood_id = @hood.id
       @user.save
     end

      if @user.save
        session[:user_id] = @user.id
        redirect_to "/users/#{@user.id}"
      else
        render :new
      end
    else
      flash[:error] = "User already exists, sigin please"
      redirect_to 'signin'
    end
  end

  def show
    render :layout => "application"
   @user = User.find_by_id(params[:id])
  end

  private

  def user_params
  params.require(:user).permit(:name, :email, :location, :password, :password_confirmation)
  end
end