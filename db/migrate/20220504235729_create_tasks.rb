class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string  :title, null: false
      t.string :category_name, null: false
      t.time    :time_start, null: false
      t.time    :time_end, null: false
      t.integer :percent, null: false
      t.references :schedule, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
