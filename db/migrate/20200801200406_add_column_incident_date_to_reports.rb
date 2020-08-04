class AddColumnIncidentDateToReports < ActiveRecord::Migration[6.0]
  def change
    add_column :reports, :incident_date, :string
  end
end
