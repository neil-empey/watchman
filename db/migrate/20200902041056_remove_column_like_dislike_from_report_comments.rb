class RemoveColumnLikeDislikeFromReportComments < ActiveRecord::Migration[6.0]
  def change
    remove_column :report_comments, :like, :integer
    remove_column :report_comments, :dislike, :integer
  end
end
