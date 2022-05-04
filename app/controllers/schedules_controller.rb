class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def new
    @schedule = Schedule.new
  end

  def create
    schedule = Schedule.new(schedule_params)
    if schedule.save
      redirect_to schedules_path, notice: 'Schedule was successfully created.'
    else
      render :new
    end
  end

  def edit; end

  private

    def schedule_params
      params.require(:schedule).permit(:title)
    end
end
