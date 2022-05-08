class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]

  def index
    @schedules = Schedule.all
  end

  def show
    @tasks = @schedule.tasks
    @task = current_user.tasks.new
    @category_array = []
    @percent_array = []
    @tasks.each do |t|
      @category_array.push(t.category_name)
      @percent_array.push(t.percent)
    end
    gon.category_array = @category_array
    gon.percent_array = @percent_array
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
