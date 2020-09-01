class AddColumnReportCommentsUserId < ActiveRecord::Migration[6.0]
  def change
    add_column :report_comments, :user_id, :integer
  end
end
