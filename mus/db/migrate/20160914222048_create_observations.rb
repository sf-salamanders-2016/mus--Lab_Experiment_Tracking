class CreateObservations < ActiveRecord::Migration[5.0]
  def change
    create_table :observations do |t|
      t.integer :user_id
      t.integer :experiment_id
      t.string :title
      t.text :text
      t.datetime :check_in
      t.datetime :check_out

      t.timestamps
    end
  end
end
