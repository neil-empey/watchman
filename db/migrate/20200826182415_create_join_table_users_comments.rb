class CreateJoinTableUsersComments < ActiveRecord::Migration[6.0]
  def change
    create_join_table :neighborhood, :comments, table_name: :neighborhood_comments do |t|
      t.boolean :like
    end
  end
end
