class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :observation_id
      t.text :text

      t.timestamps
    end
  end
end
