class User < ApplicationRecord
  has_secure_password

  belongs_to :neighborhood
  has_many :comments
  has_many :vehicles
  has_many :images
  has_many :reports

  def create
  end

end
