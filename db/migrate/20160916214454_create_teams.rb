class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.belongs_to :user, index: true
      t.belongs_to :experiment, index: true
      t.boolean :approved?, :default => false
    end
  end
end
