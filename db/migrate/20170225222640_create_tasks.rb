class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.references :project, index: true
      t.integer :priority
      t.datetime :deadline
      t.boolean :complete
      t.integer :position

      t.timestamps
    end
    add_index :tasks, %i[project_id created_at]
  end
end
