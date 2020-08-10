class CreateJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :comments_reports, :id do |t|
       t.integer :comments_id
       t.integer :report_id
    end
  end
end
