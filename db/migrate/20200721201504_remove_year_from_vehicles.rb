class RemoveYearFromVehicles < ActiveRecord::Migration[6.0]
  def change
    remove_column :vehicles, :year, :integer
  end
end
