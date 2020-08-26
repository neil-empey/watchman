class RemovecolumnneighborhoodBulletinsNotes < ActiveRecord::Migration[6.0]
  def change
    remove_column :neighborhood_bulletins, :note 
  end
end
