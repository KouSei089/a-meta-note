class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :destroy]

  def index
    @schedules = Schedule.all
    @schedule = Schedule.new
  end

  def show
    @tasks = @schedule.tasks
    @task = current_user.tasks.new
    @category_array = []
    @percent_array = []
    @color_array = []
    @tasks.each do |t|
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
          @color_array.push(t.task_categories[0].category.color_code)
        end
      end
    end
    gon.category_array = @category_array
    gon.percent_array = @percent_array
    gon.color_array = @color_array
  end

  def create
    schedule = current_user.schedules.build(schedule_params)
    if schedule.save
      redirect_to schedules_path, notice: 'Schedule was successfully created.'
    else
      render :new
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
