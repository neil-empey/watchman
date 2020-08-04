class RemoveIncidentDateFromReports < ActiveRecord::Migration[6.0]
  def change
    remove_column :reports, :incident_date, :string
  end
end
