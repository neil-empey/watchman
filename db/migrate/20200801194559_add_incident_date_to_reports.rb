class AddIncidentDateToReports < ActiveRecord::Migration[6.0]
  def change
    add_column :reports, :incident_date, :date
  end
end
