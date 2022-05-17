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
    @category_array = []
    @percent_array = []
    @color_array = []
    @task_bases.each do |t|
      if @category_array.include?(t.category_name)
        index_num = @category_array.index(t.category_name)
        @percent_array.insert(index_num, (@percent_array[index_num] + t.percent))
        @percent_array.delete_at(index_num + 1)
      else
        @category_array.push(t.category_name)
        @percent_array.push(t.percent)
        if @category_array.include?("Untitled")
          @color_array.push("rgba(166,166,166,0.5)")
        else
          @color_array.push(t.category_task_bases[0].category.color_code)
        end
      end
    end
    gon.category_array = @category_array
    gon.percent_array = @percent_array
    gon.color_array = @color_array
  end

  private

    def schedule_basis_params
      params.require(:schedule_basis).permit(:title, :pattren)
    end
end
