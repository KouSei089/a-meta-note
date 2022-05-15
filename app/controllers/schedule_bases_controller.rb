class ScheduleBasesController < ApplicationController
  def index
    @schedule_basis = ScheduleBasis.new
  end

  def create
    @schedule_basis = current_user.schedule_bases.build(schedule_basis_params)
    if @schedule_basis.save
      redirect_to schedule_bases_path
    else
      render :index
    end
  end

  private

  def schedule_basis_params
    params.require(:schedule_basis).permit(:title)
  end

end
