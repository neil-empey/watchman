class AddcolumnneighborhoodBulletinsnotetext < ActiveRecord::Migration[6.0]
  def change
    add_column :neighborhood_bulletins, :note, :text
  end
end
