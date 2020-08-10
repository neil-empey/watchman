class CommentsReports < ApplicationRecord
  belongs_to :comment
  belongs_to :report
end
