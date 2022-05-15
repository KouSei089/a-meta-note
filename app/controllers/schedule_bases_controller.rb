class ScheduleBasesController < ApplicationController
  def index
    @schedule_base = ScheduleBase.new
  end

  def create
    @schedule_base = current_user.schedule_bases.build(schedule_base_params)
    if @schedule_base.save
      redirect_to schedule_bases_path
    else
      render :index
    end
  end

  private

  def schedule_base_params
    params.require(:schedule_base).permit(:title)
  end

end
