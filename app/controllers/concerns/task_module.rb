module TaskModule
  extend ActiveSupport::Concern

  def task_category_name?(task)
    return if task.category_name == "Untitled"

    categories = Category.all
    @categories_select = categories.select { |category| category.name == task.category_name }
    task.categories << @categories_select[0]
  end
end
