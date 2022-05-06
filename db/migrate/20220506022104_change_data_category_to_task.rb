class ChangeDataCategoryToTask < ActiveRecord::Migration[7.0]
  def change
    rename_column :tasks, :category_id, :category
    change_column :tasks, :category, :string
  end
end
