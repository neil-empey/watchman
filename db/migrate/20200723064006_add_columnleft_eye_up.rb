class AddColumnleftEyeUp < ActiveRecord::Migration[6.0]
  def change
    add_column :images, :leftEyeUp, :string
  end
end
