class User < ApplicationRecord
  has_secure_password

  belongs_to :neighborhood
  has_many :comments
  has_many :vehicles
  has_many :images
  has_many :reports
  has_many :likes, dependent: :destroy



  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :password, length: { in: 6..200 }, on: :create


  def self.find_or_create_by_omniauth(auth)
    where(id: auth.uid[0..7]).first_or_initialize do |user|
      user.id ||= auth.uid
      string = user.id.to_s
      user.id = string[0..7].to_i
      user.name = auth.info.name
      user.email = auth.info.email
      user.location = '00000'
      if Neighborhood.find_by_id(user.location.to_i) == nil
        @new_hood = Neighborhood.create(location: user.location)
        @new_hood.id = @new_hood.location.to_i
        @new_hood.save
        user.neighborhood_id = user.location
      else
        @hood = Neighborhood.find_by_id(user.location.to_i)
        user.neighborhood_id = @hood.id
      end

      if !user.password_digest
        pass = SecureRandom.hex(30)
        user.password = pass
        user.password_confirmation = pass
      end

      user.save(:validate => false)
    end
  end
end
