module ScheduleModule
  extend ActiveSupport::Concern

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
          @color_array.push(t.category_task_bases[0].category.color_code)
        end
      end
    end
  end
end
