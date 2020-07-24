class AddVehicleDataToReports < ActiveRecord::Migration[6.0]
  def change
    add_column :reports, :vehicle_data, :text
  end
end
