class User < ApplicationRecord
  has_secure_password

  belongs_to :neighborhood
  has_many :comments
  has_many :vehicles
  has_many :images
  has_many :reports
  

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, confirmation: true, length: { in: 6..20 }
  validates :password_confirmation, presence: true

  def self.find_or_create_by_omniauth(auth)

  where(uid: auth.uid).first_or_initialize do |user|
    user.uid ||= auth.uid
    user.name = auth.info.name
    user.email = auth.info.email

    if !user.password_digest
      pass = SecureRandom.hex(30)
      user.password = pass
      user.password_confirmation = pass
    end

    user.save
  end
end


end
