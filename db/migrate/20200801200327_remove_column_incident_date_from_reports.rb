class RemoveColumnIncidentDateFromReports < ActiveRecord::Migration[6.0]
  def change
    remove_column :reports, :incident_date, :date
  end
end
