class CreateSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :schedules do |t|
      t.date :title
      t.float :analysis

      t.timestamps
    end
  end
end
