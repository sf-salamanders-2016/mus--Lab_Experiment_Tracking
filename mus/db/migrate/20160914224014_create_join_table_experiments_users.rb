class CreateJoinTableExperimentsUsers < ActiveRecord::Migration[5.0]
  def change
    create_join_table :users, :experiments do |t|
      t.index [:user_id, :experiment_id]
      t.index [:experiment_id, :user_id]
    end
  end
end
