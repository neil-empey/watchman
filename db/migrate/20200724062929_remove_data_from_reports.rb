class RemoveDataFromReports < ActiveRecord::Migration[6.0]
  def change
    remove_column :reports, :data, :text
  end
end
