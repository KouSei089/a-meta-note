class ScheduleBasesController < ApplicationController
  include ScheduleModule

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
    @category_array = []
    @percent_array = []
    @color_array = []
    add_task_analyses(@task_bases)
    gon.category_array = @category_array
    gon.percent_array = @percent_array
    gon.color_array = @color_array
  end

  def destroy
    @schedule_basis = current_user.schedule_bases.find(params[:id])
    @schedule_basis.destroy!
    redirect_to schedule_bases_path, notice: 'Schedule was successfully deleted.', status: :see_other
  end

  private

    def schedule_basis_params
      params.require(:schedule_basis).permit(:title, :pattren)
    end
end
