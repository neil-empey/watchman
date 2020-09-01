class ReportCommentsController < ApplicationController
   before_action :find_comment

  def create
    if already_liked?
      flash[:notice] = "You can't like more than once"
    else
    @report_comment_like = ReportComments.create(comment_id: @comment.id, report_id: @comment.report_id, user_id: current_user.id, like: 1)
    @report_comment_like.save
    end   
    redirect_to "neighborhoods/#{current_user.neighborhood_id}/users"
  end

  private

  def find_comment
    @comment = Comment.find(params[:id])
  end

  def already_liked?
  ReportComments.where(user_id: current_user.id, comment_id:
  params[:id]).exists?
  end

end
