class ApplicationController < ActionController::Base

  include ApplicationHelper

  private

  def require_login
  redirect_to "/", notice: "Please log in or sign up" unless current_user
  end

  helper_method :require_login

  def set_vars
    @user = current_user
  end

  helper_method :set_vars
end
