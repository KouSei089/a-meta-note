class ScheduleBasesController < ApplicationController
  def index
    @schedule_basis = ScheduleBasis.new
    @schedule_bases = ScheduleBasis.all
  end

  def create
    @schedule_basis = current_user.schedule_bases.build(schedule_basis_params)
    if @schedule_basis.save
      redirect_to schedule_bases_path
    else
      render :index
    end
  end

  def show
    @schedule_basis = current_user.schedule_bases.find(params[:id])
    @task_basis = current_user.task_bases.new
    @task_bases = @schedule_basis.task_bases.all
  end

  private

  def schedule_basis_params
    params.require(:schedule_basis).permit(:title)
  end

end
