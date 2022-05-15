class TasksController < ApplicationController
  def new; end

  def create
    @task = current_user.tasks.build(task_params)
    @task.percent_calculation
    @task.category_name.presence || @task.category_name = ("Untitled")
    if @task.save
      unless @task.category_name == "Untitled"
        categories = Category.all
        @categories_select = categories.select { |category| category.name == @task.category_name }
        @task.categories << @categories_select[0]
      end
      flash.now.notice = "タスクを登録しました。"
    else
      redirect_to schedules_path
    end
  end

  def destroy
    task = current_user.tasks.find(params[:id])
    task.destroy
    flash.now.notice = "タスクを削除しました。"
  end

  private

    def task_params
      params.require(:task).permit(:title, :category_name, :time_start, :time_end, :persent, :schedule_id)
    end
end
