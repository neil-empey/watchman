class DropTableCommentsReports < ActiveRecord::Migration[6.0]
  def change
    drop_table :comments_reports
  end
end
