class User < ApplicationRecord
  has_secure_password


  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, confirmation: true, length: { in: 6..20 }
  validates :password_confirmation, presence: true


  belongs_to :neighborhood
  has_many :comments
  has_many :vehicles
  has_many :images
  has_many :reports

  def create
  end

end
