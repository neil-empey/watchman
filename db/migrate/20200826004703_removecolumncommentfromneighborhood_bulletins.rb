class RemovecolumncommentfromneighborhoodBulletins < ActiveRecord::Migration[6.0]
  def change
    remove_column :neighborhood_bulletins, :comment
  end
end
