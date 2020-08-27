class AddColumnToNeighborhoodComments < ActiveRecord::Migration[6.0]
  def change
    add_column :neighborhood_comments, :post, :text
  end
end
