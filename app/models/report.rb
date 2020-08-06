class Report < ApplicationRecord
  belongs_to :user
  has_many :vehicles, through: :users
  has_many :images, through: :users
  has_many :users
  has_many :comments, through: :users

  def create
  end
end
