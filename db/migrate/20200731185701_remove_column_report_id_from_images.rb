class RemoveColumnReportIdFromImages < ActiveRecord::Migration[6.0]
  def change
    remove_index :images, :report_id
  end
end
