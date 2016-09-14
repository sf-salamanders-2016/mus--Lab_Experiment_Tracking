class UsersExperiments < ActiveRecord::Migration[5.0]
  def change
    create_table users_experiments do |t|
      t.integer :user_id
      t.integer :experiment_id
      t.boolean :approved?

      t.timestamps
  end
end
