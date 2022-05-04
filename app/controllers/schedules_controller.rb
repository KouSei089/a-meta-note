class SchedulesController < ApplicationController
  def index; end

  def show; end

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
