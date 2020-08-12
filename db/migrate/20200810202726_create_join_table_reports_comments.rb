class CreateJoinTableReportsComments < ActiveRecord::Migration[6.0]
  def change
    create_join_table :reports, :comments do |t|
       t.index [:report_id, :comment_id]
       t.index [:comment_id, :report_id]
    end
  end
end
