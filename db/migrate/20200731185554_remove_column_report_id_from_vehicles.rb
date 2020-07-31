class RemoveColumnReportIdFromVehicles < ActiveRecord::Migration[6.0]
  def change
    remove_index :vehicles, :report_id
  end
end
