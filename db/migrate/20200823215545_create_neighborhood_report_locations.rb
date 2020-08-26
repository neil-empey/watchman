class CreateNeighborhoodReportLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :neighborhood_report_locations do |t|
      t.string :location
      t.string :suspects
      t.belongs_to :neighborhood, null: false, foreign_key: true
      t.belongs_to :report, null: false, foreign_key: true

      t.timestamps
    end
  end
end
