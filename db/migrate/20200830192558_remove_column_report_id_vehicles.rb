class RemoveColumnReportIdVehicles < ActiveRecord::Migration[6.0]
  def change
    remove_column :vehicles, :report_id
    add_column :vehicles, :neighborhood_id, :integer
  end
end
