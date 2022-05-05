class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string  :task_title, null: false
      t.integer :task_category_id, null: false
      t.time    :task_resource, null: false
      t.timestamps
    end
  end
end
