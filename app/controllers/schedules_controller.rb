class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :destroy]
  before_action :set_q, only: [:index]

  include ScheduleModule

  def index
    @schedule = Schedule.new
    @results = @q.result.order(title: :DESC)
  end

  def show
    @tasks = @schedule.tasks.order(time_start: :asc)
    @task = current_user.tasks.new
    @category_array = []
    @percent_array = []
    @color_array = []
    add_task_analyses(@tasks)
    gon.category_array = @category_array
    gon.percent_array = @percent_array
    gon.color_array = @color_array
    @schedule_basis = pattren_select(@schedule)
    @task_bases = @schedule_basis.task_bases.order(time_start: :asc)
    @task_basis = @schedule_basis.task_bases.new
    @basis_category_array = []
    @basis_percent_array = []
    @basis_color_array = []
    add_task_basis_analyses(@task_bases)
    gon.basis_category_array = @basis_category_array
    gon.basis_percent_array = @basis_percent_array
    gon.basis_color_array = @basis_color_array
    analysis_feedback(@tasks, @task_bases)
    gon.name_results = @name_results
    gon.color_results = @color_results
    gon.percent_results = @percent_results
  end

  def create
    schedule = current_user.schedules.build(schedule_params)
    if schedule.save
      redirect_to schedules_path, notice: 'Schedule was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @schedule.destroy!
    redirect_to schedules_path, notice: 'Schedule was successfully deleted.', status: :see_other
  end

  private

    def set_q
      @q = Schedule.where(user_id: current_user.id).includes(:user).ransack(params[:q])
    end

    def schedule_params
      params.require(:schedule).permit(:title, :pattren)
    end

    def set_schedule
      @schedule = current_user.schedules.find(params[:id])
    end
end
