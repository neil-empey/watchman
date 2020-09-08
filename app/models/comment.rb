class Comment < ApplicationRecord
  belongs_to :user
  has_many :report_comments, dependent: :destroy


  validates :content, presence: true, length: { maximum: 100, too_long: "%{count} characters is the maximum allowed" }
  validates :user_id, presence: true

  scope :all_comments, -> (report) {where(report_id: report.id)}

  def new
    @comment
  end

  def create
  end
end
