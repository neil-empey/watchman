class AddColumnReportIdComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :report_id, :integer
  end
end
