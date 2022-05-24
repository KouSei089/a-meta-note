module ScheduleModule
  extend ActiveSupport::Concern

  def add_task_basis_analyses(task_bases)
    task_bases.each do |t|
      if @basis_category_array.include?(t.category_name)
        index_num = @basis_category_array.index(t.category_name)
        @basis_percent_array.insert(index_num, (@basis_percent_array[index_num] + t.percent))
        @basis_percent_array.delete_at(index_num + 1)
      else
        @basis_category_array.push(t.category_name)
        @basis_percent_array.push(t.percent)
        if @basis_category_array.include?("Untitled")
          @basis_color_array.push("rgba(166,166,166,0.5)")
        else
          @basis_color_array.push(t.category_task_bases[0].category.color_code)
        end
      end
    end
  end

  def add_task_analyses(tasks)
    tasks.each do |t|
      if @category_array.include?(t.category_name)
        index_num = @category_array.index(t.category_name)
        @percent_array.insert(index_num, (@percent_array[index_num] + t.percent))
        @percent_array.delete_at(index_num + 1)
      else
        @category_array.push(t.category_name)
        @percent_array.push(t.percent)
        if @category_array.include?("Untitled")
          @color_array.push("rgba(166,166,166,0.5)")
        else
          @color_array.push(t.task_categories[0].category.color_code)
        end
      end
    end
  end

  def pattren_select(schedule)
    if schedule.pattren.include?("weekday")
      current_user.schedule_bases.find_by(pattren: "weekday")
    else
      current_user.schedule_bases.find_by(pattren: "holiday")
    end
  end

  def analysis_feedback(tasks, task_bases)
    @name_results = []
    @color_results = []
    @percent_results = []
    task_category_results = []
    task_category_names = tasks.pluck(:category_name).uniq
    task_basis_category_names = task_bases.pluck(:category_name).uniq
    task_category_results = task_category_names & task_basis_category_names
    index_num = 0
    task_category_results.count.times do
      task_categories_sames = tasks.where(category_name: task_category_results[index_num])
      task_percent_sum = task_categories_sames.pluck(:percent).sum
      task_basis_categories_sames = task_bases.where(category_name: task_category_results[index_num])
      task_basis_percent_sum = task_basis_categories_sames.pluck(:percent).sum
      percent_result = if task_percent_sum > task_basis_percent_sum
                         task_percent_sum - task_basis_percent_sum
                       else
                         task_basis_percent_sum - task_percent_sum
                       end
      @name_results.push(task_categories_sames[0].category_name)
      @color_results.push(task_categories_sames[0].categories[0].color_code)
      @percent_results.push(percent_result)
      index_num += 1
    end
  end
end
