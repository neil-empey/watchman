class Like < ApplicationRecord
  belongs_to :report
  belongs_to :user

  validates :user_id, :report_id, presence: true
end
