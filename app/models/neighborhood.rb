class Neighborhood < ApplicationRecord
  has_many :reports, through: :users
  has_many :users

  def new

  end

  def create
  end
end
