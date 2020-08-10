class AddColumnConfidenceToImages < ActiveRecord::Migration[6.0]
  def change
    add_column :images, :confidence, :string
  end
end
