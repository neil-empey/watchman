class Neighborhood < ApplicationRecord
  has_many :users
  has_many :reports, through: :users
  has_many :neighborhood_bulletins
  has_many :notes, through: :neighborhood_bulletins



  def new
  end

  def create
  end
end
