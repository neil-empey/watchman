class AddleftEyeRightToImages < ActiveRecord::Migration[6.0]
  def change
    add_column :images, :leftEyeRight, :string
  end
end
