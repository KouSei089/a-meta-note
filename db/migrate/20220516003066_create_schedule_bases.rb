class CreateScheduleBases < ActiveRecord::Migration[7.0]
  def change
    create_table :schedule_bases do |t|
      t.string :title, null: false
      t.string :pattren, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :schedule_bases, ["pattren"], unique: true
  end
end
