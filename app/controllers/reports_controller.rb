class ReportsController < ApplicationController

  def index
    if params[:user_id] && @user = User.find_by_id(:user_id)
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
    @user = current_user

    report = Report.new(:first_name => p["first_name"], :last_name => p["last_name"], :address => p["address"], :telephone_number => p["telephone_number"], :incident_date => ["incident_date"], :summary => p["summary"], :user_id => @user.id, :suspect_data => p["suspect_data"].join('##'), :vehicle_data => p["vehicle_data"].join('##'))
    report.save

    report
  end

end
