class Report < ApplicationRecord
  belongs_to :user
  belongs_to :neighborhood
  has_many :users
  has_many :likes, dependent: :destroy
  has_many :comments, through: :users
  has_many :vehicles, through: :user
  has_many :images, through: :user





  validates :first_name, :last_name, :address, :telephone_number, :incident_date, :suspect_data, :vehicle_data, presence: true, on: :create

  def create
  end
end
