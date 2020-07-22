class AddYearToVehicles < ActiveRecord::Migration[6.0]
  def change
    add_column :vehicles, :year, :string
  end
end
