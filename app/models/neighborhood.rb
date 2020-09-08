class Neighborhood < ApplicationRecord
  has_many :users
  has_many :reports
  has_many :vehicles
  has_many :images
  has_many :likes, through: :users

  def new
  end

  def create
  end
end
