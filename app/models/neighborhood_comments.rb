class Neighborhood_Comments < ApplicationRecord
  belongs_to :comment
  belongs_to :neighborhood
end
