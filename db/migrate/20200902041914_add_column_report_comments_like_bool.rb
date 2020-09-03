class AddColumnReportCommentsLikeBool < ActiveRecord::Migration[6.0]
  def change
    add_column :report_comments, :like, :boolean
  end
end
