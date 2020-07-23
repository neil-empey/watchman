class RemoveColumnleftEyeRightleftEyeUpFromImages < ActiveRecord::Migration[6.0]
  def change
    remove_column :images, :leftEyeRightleftEyeUp, :string
  end
end
