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

  def create

  end
end
