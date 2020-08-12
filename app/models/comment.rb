class Comment < ApplicationRecord
  belongs_to :user
  has_many :reports_comments
  has_many :reports, through: :reports_comments

  validates :content, presence: true, length: { maximum: 50, too_long: "%{count} characters is the maximum allowed" }

  def new
    @comment
  end

  def create
  end
end
