class CommentsController < ApplicationController
  layout "user"
  before_action :require_login, :set_vars

  def index
    if params["id"]
      @user = User.find_by_id(current_user.id)
    else
      @error = "Report is Unavailable" if params["id"]
      @comment = Comment.all
    end
  end

  def new
    report = Report.find_by_id(params["id"])

      if Comment.all.select {|comment| comment.user_id == current_user.id && comment.report_id == params["id"].to_i}.empty?
        render :new
      else
        flash[:notice] = "Only one comment per report"
        redirect_to "/neighborhoods/#{current_user.neighborhood.id}/users"
      end
  end

  def create
      @comment = comments_params
      @comment.save

        redirect_to "/neighborhoods/#{current_user.neighborhood.id}/users"
  end

  def show
  end

  private

  def find_comment
    @comment = Comment.find_by_id(comments_params["id"])
  end

  def comments_params
    params.permit("authenticity_token", "content", "id", "commit")
    comment = Comment.create(:content => params["content"], :user_id => current_user.id, :report_id => params["id"])
    comment
  end
end
