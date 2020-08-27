class Comment < ApplicationRecord
  belongs_to :user
  has_many :neighborhood_comments
  has_many :neighborhoods, through: :neighborhood_comments

  validates :content, presence: true, length: { maximum: 100, too_long: "%{count} characters is the maximum allowed" }

  scope :all_comments, -> (report) {where(report_id: report.id)}

  def new
    @comment
  end

  def create
  end
end
