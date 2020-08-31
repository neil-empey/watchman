class Neighborhood < ApplicationRecord
  has_many :users
  has_many :reports
  has_many :vehicles
  has_many :images
  has_many :report_comments, through: :reports

  def new
  end

  def create
  end
end
