# app/controllers/concerns/secured.rb

module Secured
  extend ActiveSupport::Concern

  included do
    before_action :authorized
  end

  def authorized
     return head(:forbidden) unless session.include? :user_id
  end
end
