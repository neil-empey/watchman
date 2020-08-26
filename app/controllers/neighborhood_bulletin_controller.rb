class NeighborhoodBulletinController < ApplicationController
  layout "user"
  before_action :require_login

  def new
    @neighborhood_bulletin
  end

end
