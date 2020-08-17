class Neighborhood < ApplicationRecord
  has_many :users
  has_many :reports, through: :users


  def new
  end

  def create
  end
end
