class ReportsController < ApplicationController
  layout "user"


  def index
      if @user = User.find_by_id(params[:id])
      @reports = @user.reports
      else
      flash[:message] = "You have no reports available"
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
    @report = report_create(params)
    redirect_to "/users/#{@user.id}/reports/#{@report.id}"
  end

  def destroy
    @report.destroy
    redirect_to "/users/#{current_user.id}", notice: 'Report destroyed'
  end

  private

  def report_create(params)
    p = params["report"]
    crime_date = p["incident_date(2i)"] + p["incident_date(3i)"] + p["incident_date(1i)"]
    @user = current_user

    report = Report.new(:first_name => p["first_name"], :last_name => p["last_name"], :address => p["address"], :telephone_number => p["telephone_number"], :incident_date => crime_date, :summary => p["summary"], :user_id => @user.id, :suspect_data => p["suspect_data"].join('##'), :vehicle_data => p["vehicle_data"].join('##'))
    report.save

    report
  end

end
