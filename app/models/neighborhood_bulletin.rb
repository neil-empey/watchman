class NeighborhoodBulletin < ApplicationRecord
  belongs_to :user
  belongs_to :neighborhood

    validates :note, presence: true, length: { maximum: 100, too_long: "%{count} characters is the maximum allowed" }
end
