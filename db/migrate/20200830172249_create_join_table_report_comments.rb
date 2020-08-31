class CreateJoinTableReportComments < ActiveRecord::Migration[6.0]
  def change
    create_join_table :report, :comment, table_name: :report_comments do |t|
      t.integer :like
      t.integer :dislike
    end
  end
end
