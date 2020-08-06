class CommentsController < ApplicationController
  layout "user"

  def index
    if params["id"] && @report = Report.find_by_id(params["id"])
      @comment = @report.comment
    else
      @error = "Report is Unavailable" if params["id"]
      @comment = Comment.all
    end
  end

  def new
    if params["id"] && @report = Report.find_by_id(params["id"])
      @comment = @report.comments.build
    else
      @error = "Report is Unavailable" if params["id"]
      @comment = Comment.new
    end
  end

  def create
      comments_params
      if @comment.save
        redirect_to "/neighborhoods/#{current_user.neighborhood.id}/reports/#{@comment.report_id}"
      else
        render :new
      end
    end

    def show
    end

  private

  def comments_params
    #debugger
    params.permit("content", "id")
    @comment = Comment.new(:content => params["content"], :user_id => current_user.id, :report_id => params["id"])
  end

end
