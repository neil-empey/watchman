class DropTableReportComments < ActiveRecord::Migration[6.0]
  def change
    drop_table :report_comments
  end
end
