class DroptableneighborhoodReportLocations < ActiveRecord::Migration[6.0]
  def change
    drop_table :neighborhood_report_locations
  end
end
