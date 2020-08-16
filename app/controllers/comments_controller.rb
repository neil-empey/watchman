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
    @comment
    if params["id"] && @report = Report.find_by_id(params["id"])
      render :new
    else
      @error = "Report is unavailable for comment" if params["id"]
    end

  end

  def create
      @comment = Comment.create(comments_params)
      debugger
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
    params_hash = {}
    params.permit("content", "id")
    params_hash[:user_id] = current_user.id
    params_hash[:report_id] = params["id"]
    params_hash[:content] = params["content"]
    params_hash

  end

end
