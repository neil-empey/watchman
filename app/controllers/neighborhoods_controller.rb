class NeighborhoodsController < ApplicationController
  layout "user"
  before_action :require_login

  def index
    @user = User.find_by_id(current_user.id)
    @hood = Neighborhood.find_by_id(@user.neighborhood)
  end

  def show

  end

end
