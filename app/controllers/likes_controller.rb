class LikesController < ApplicationController
  before_action :find_report

  def create
    if already_liked?
      flash[:notice] = "Only 1 like per report"
    else
      @report.likes.create(user_id: current_user.id)
    end
      redirect_to "/neighborhoods/#{current_user.neighborhood_id}/users"
  end

  private

  def find_report
    @report = Report.find(params[:report_id])
  end

  def already_liked?
    Like.where(user_id: current_user.id, report_id:
    params[:report_id]).exists?
  end
end
