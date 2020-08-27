class DropTableNeighborhoodBulletin < ActiveRecord::Migration[6.0]
  def change
    drop_table :neighborhood_bulletins
  end
end
