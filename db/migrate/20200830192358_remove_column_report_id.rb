class RemoveColumnReportId < ActiveRecord::Migration[6.0]
  def change
    remove_column :images, :report_id
    add_column :images, :neighborhood_id, :integer
  end
end
