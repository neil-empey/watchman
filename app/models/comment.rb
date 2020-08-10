class Comment < ApplicationRecord
  belongs_to :user
  has_many :comments_reports
  has_many :reports, through: :comments_reports

  validates :content, presence: true, length: { maximum: 50, too_long: "%{count} characters is the maximum allowed" }

  def new
    @comment
  end

  def create
  end
end
