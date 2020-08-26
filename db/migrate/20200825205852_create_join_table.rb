class CreateJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :neighborhoods, :users, table_name: :neighborhood_bulletins do |t|
       t.index [:neighborhood_id, :user_id]
       t.index [:user_id, :neighborhood_id]
       t.string :location
       t.text :comment
       t.string :suspects
      end
    end
  end
