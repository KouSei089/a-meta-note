class TasksController < ApplicationController
  def new; end

  def create
    @task = current_user.tasks.build(task_params)
    @task.percent_calculation
    if @task.save
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
      params.require(:task).permit(:title, :category, :time_start, :time_end, :persent, :schedule_id)
    end
end
