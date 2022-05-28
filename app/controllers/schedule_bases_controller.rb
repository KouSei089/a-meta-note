class ScheduleBasesController < ApplicationController
  include ScheduleModule

  def index
    @schedule_basis = ScheduleBasis.new
    @schedule_bases = ScheduleBasis.where(user_id: current_user.id).includes(:user).all
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
    @basis_category_array = []
    @basis_percent_array = []
    @basis_color_array = []
    add_task_basis_analyses(@task_bases)
    gon.basis_category_array = @basis_category_array
    gon.basis_percent_array = @basis_percent_array
    gon.basis_color_array = @basis_color_array
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
