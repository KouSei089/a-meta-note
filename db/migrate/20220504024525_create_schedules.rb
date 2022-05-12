class CreateSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :schedules do |t|
      t.date :title, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
