class TasksController < ApplicationController
  include TaskModule

  def new; end

  def create
    @task = current_user.tasks.build(task_params)
    @task.percent_calculation
    @task.category_name_exist
    if @task.save
      task_category_name?(@task)
      flash.now.notice = "Task was successfully created."
    else
      redirect_to schedules_path
    end
  end

  def destroy
    task = current_user.tasks.find(params[:id])
    task.destroy
    flash.now.notice = "Task was successfully deleted."
  end

  private

    def task_params
      params.require(:task).permit(:title, :category_name, :time_start, :time_end, :persent, :schedule_id)
    end
end
