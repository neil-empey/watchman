class Report < ApplicationRecord
  belongs_to :user
  has_many :vehicles
  has_many :images
  has_many :comments, through: :users

  def create
  end
end
