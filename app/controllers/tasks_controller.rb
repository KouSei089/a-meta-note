class TasksController < ApplicationController
  def new; end

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      flash.now.notice = "タスクを登録しました。"
    else
      redirect_to schedules_path
    end
  end

  private

    def task_params
      params.require(:task).permit(:title, :category_id, :resource, :schedule_id)
    end
end
