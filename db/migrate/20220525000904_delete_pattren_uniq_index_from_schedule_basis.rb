class DeletePattrenUniqIndexFromScheduleBasis < ActiveRecord::Migration[7.0]
  def change
    remove_index :schedule_bases, :pattren
  end
end
