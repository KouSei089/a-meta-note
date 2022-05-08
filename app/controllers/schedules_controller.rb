class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]

  def index
    @schedules = Schedule.all
  end

  def show
    @tasks = @schedule.tasks
    @task = current_user.tasks.new
    @task_categoires = []
    @task_percents = []
    @tasks.each do |t|
      @task_categoires.push(t.category_name)
      @task_percents.push(t.percent)
    end
    gon.task_array = @task_categoires
    gon.task_per = @task_percents
  end

  def new
    @schedule = Schedule.new
  end

  def create
    schedule = current_user.schedules.build(schedule_params)
    if schedule.save
      redirect_to schedules_path, notice: 'Schedule was successfully created.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @schedule.update(schedule_params)
      redirect_to schedules_path, notice: 'Schedule edit comp'
    else
      render :edit
    end
  end

  def destroy
    @schedule.destroy!
    redirect_to schedules_path, notice: 'Schedule delete comp', status: :see_other
  end

  private

    def schedule_params
      params.require(:schedule).permit(:title)
    end

    def set_schedule
      @schedule = current_user.schedules.find(params[:id])
    end
end
