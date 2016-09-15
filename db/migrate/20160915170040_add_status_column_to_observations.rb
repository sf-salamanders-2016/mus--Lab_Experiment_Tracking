class AddStatusColumnToObservations < ActiveRecord::Migration[5.0]
  def change
    add_column :observations, :status, :string
  end
end
