# app/controllers/concerns/secured.rb

module Secured
  extend ActiveSupport::Concern

  included do
    before_action :authorized, :require_login, :set_vars
  end

  def authorized
     return head(:forbidden) unless session.include? :user_id
  end

  def require_login
  redirect_to :root_path, notice: "Please log in or sign up" unless current_user
  end

  def set_vars
    @user = current_user
  end
end
