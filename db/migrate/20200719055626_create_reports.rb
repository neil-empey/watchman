class CreateReports < ActiveRecord::Migration[6.0]
  def change
    create_table :reports do |t|
      t.string :first_name
      t.string :last_name
      t.text :address
      t.string :telephone_number
      t.string :incident_date
      t.text :summary
      t.text :data
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
