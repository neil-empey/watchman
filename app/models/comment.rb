class Comment < ApplicationRecord
  belongs_to :user

  def new
    @comment
  end

  def create
  end
end
