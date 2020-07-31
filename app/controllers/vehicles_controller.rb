class VehiclesController < ApplicationController



  def index
    if params[:report_id]
      @vehicles = Vehicle.find(params[:report_id]).vehicles
    else
      @vehicles = Vehicle.all
    end
  end

  def show
    @user = current_user
  end

  def new
    @user = current_user
  end

  def create
    Vehicle.add(current_user)
    redirect_to "/users/#{current_user.id}"
  end
end
