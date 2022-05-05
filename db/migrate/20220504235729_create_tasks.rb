class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string  :title, null: false
      t.integer :category_id, null: false
      t.time    :resource, null: false
      t.references :schedule, null: false, foreign_key: true
      t.timestamps
    end
  end
end
