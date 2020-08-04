class NeighborhoodsController < ApplicationController
  layout "user"

  def index
    @user = User.find_by_id(current_user.id)
    @hood = Neighborhood.find_by_id(@user.neighborhood)
  end
end
