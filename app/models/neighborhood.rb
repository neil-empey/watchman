class Neighborhood < ApplicationRecord
  has_many :users
  has_many :reports, through: :users
  has_many :neighborhood_comments
  has_many :comments, through: :neighborhood_comments





  def new
  end

  def create
  end
end
