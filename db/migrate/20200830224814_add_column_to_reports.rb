class AddColumnToReports < ActiveRecord::Migration[6.0]
  def change
    add_column :reports, :neighborhood_id, :integer
  end
end
