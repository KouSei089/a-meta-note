class CreateCategoryTaskBases < ActiveRecord::Migration[7.0]
  def change
    create_table :category_task_bases do |t|
      t.references :task_basis, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.timestamps
    end
  end
end
