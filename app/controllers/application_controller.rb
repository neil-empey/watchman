class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include ApplicationHelper

  private

  def authorized
     return head(:forbidden) unless session.include? :user_id
  end

  helper_method :authorized
end
