class AddSuspectDataToReports < ActiveRecord::Migration[6.0]
  def change
    add_column :reports, :suspect_data, :text
  end
end
