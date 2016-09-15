class CreateExperiments < ActiveRecord::Migration[5.0]
  def change
    create_table :experiments do |t|
      t.integer :project_admin_id
      t.boolean :approved?
      t.string :title
      t.text :hypothesis
      t.text :summary
      t.text :body

      t.timestamps
    end
  end
end
