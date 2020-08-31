class ReportsController < ApplicationController
  layout "user"
  before_action :require_login

  def index
    @user = User.find_by_id(params[:id])
      if @user.reports.length < 1
        flash[:message] = "You have no reports available"
        redirect_to "/users/#{@user.id}/"
      end
  end

  def new
    @report = Report.new
    @user = current_user
  end

  def show
    @report = Report.find_by_id(params["id"])
  end

  def create
    @user = current_user
    @hood = Neighborhood.find_by_id(@user.neighborhood.id)
    @report = Report.create(:first_name => report_params["first_name"], :last_name => report_params["last_name"], :address => report_params["address"], :telephone_number => report_params["telephone_number"], :incident_date => report_params["incident_date"], :summary => report_params["summary"], :suspect_data => report_params["suspect_data"], :vehicle_data => report_params["vehicle_data"], :user => @user, :neighborhood => @hood)

    if @report.save
    redirect_to "/users/#{@user.id}/reports/#{@report.id}"
    else
      render :new
    end
  end

  def destroy
    @report.destroy
    redirect_to "/users/#{current_user.id}", notice: 'Report destroyed'
  end

  private

  def report_params
    params.require(:report).permit(:first_name, :last_name, :address, :telephone_number, :incident_date, :summary, :suspect_data, :vehicle_data)
  end

end
