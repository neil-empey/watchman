class CommentsController < ApplicationController

  def index
    if params[:report_id] && @report = find_by_id(params[:report_id])
      @comments = @report.comments
    else
      @error = "Report is Unavailable" if params[:report_id]
      @comments = Comment.all
    end
  end

  def new
    if params[:report_id] && @report = find_by_id(params[:report_id])
      @comment = @report.comments.build
    else
      @error = "Report is Unavailable" if params[:report_id]
      @comment = Comment.new
    end
  end

  def create
    @comment = current_user.comments.build(comments_params)
      if @comment.save
        redirect_to comments_path
      else
        render :new
      end
  end

end
