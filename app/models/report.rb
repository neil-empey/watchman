class Report < ApplicationRecord
  belongs_to :user
  has_many :vehicles, through: :users
  has_many :images, through: :users
  has_many :users
  has_many :comments 
  has_many :comments, through: :users

  validates :first_name, :last_name, :address, :telephone_number, :incident_date, :suspect_data, :vehicle_data, presence: true, on: :create

  validates :incident_date, uniqueness: { scope: %i[user_id], message: 'one incident report per 24hr period'}


  def create
    debugger
    p = params["report"]
    crime_date = p["incident_date(2i)"] + p["incident_date(3i)"] + p["incident_date(1i)"]

    @report = Report.new(:first_name => p["first_name"], :last_name => p["last_name"], :address => p["address"], :telephone_number => p["telephone_number"], :incident_date => crime_date, :summary => p["summary"], :user_id => @user.id, :suspect_data => p["suspect_data"].join('##'), :vehicle_data => p["vehicle_data"].join('##'))
    @report.save

    @report
  end
end
