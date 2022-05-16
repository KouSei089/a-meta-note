class TaskBasesController < ApplicationController
  def new; end

  def create
    @task_basis = current_user.task_bases.build(task_basis_params)
    @task_basis.percent_calculation
    @task_basis.category_name.presence || @task_basis.category_name = ("Untitled")
    if @task_basis.save
      unless @task_basis.category_name == "Untitled"
        categories = Category.all
        @categories_select = categories.select { |category| category.name == @task_basis.category_name }
        @task_basis.categories << @categories_select[0]
      end
      flash.now.notice = "Task was successfully created."
    else
      redirect_to schedule_bases_path
    end
  end

  def destroy
    task_basis = current_user.task_bases.find(params[:id])
    task_basis.destroy
    flash.now.notice = "Task was successfully deleted."
  end

  private

    def task_basis_params
      params.require(:task_basis).permit(:title, :category_name, :time_start, :time_end, :persent, :schedule_basis_id)
    end
end
