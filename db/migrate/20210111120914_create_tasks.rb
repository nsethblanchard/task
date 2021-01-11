class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :task_name
      t.string :task_type
      t.string :task_content
      t.string :date_due
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
