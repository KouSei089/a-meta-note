class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :destroy]
  before_action :set_q, only: [:index]

  def index
    @schedule = Schedule.new
    @results = @q.result.order(title: :DESC)
  end

  def show
    @tasks = @schedule.tasks.order(time_start: :asc)
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
    # schedule_baseロジック
    @schedule_basis = if @schedule.pattren.include?("weekday")
                        current_user.schedule_bases.find_by(pattren: "weekday")
                      else
                        current_user.schedule_bases.find_by(pattren: "holiday")
                      end
    @task_bases = @schedule_basis.task_bases.order(time_start: :asc)
    @task_basis = @schedule_basis.task_bases.new
    @basis_category_array = []
    @basis_percent_array = []
    @basis_color_array = []
    @task_bases.each do |t|
      if @basis_category_array.include?(t.category_name)
        index_num = @basis_category_array.index(t.category_name)
        @basis_percent_array.insert(index_num, (@basis_percent_array[index_num] + t.percent))
        @basis_percent_array.delete_at(index_num + 1)
      else
        @basis_category_array.push(t.category_name)
        @basis_percent_array.push(t.percent)
        if @basis_category_array.include?("Untitled")
          @basis_color_array.push("rgba(166,166,166,0.5)")
        else
          @basis_color_array.push(t.category_task_bases[0].category.color_code)
        end
      end
    end
    gon.basis_category_array = @basis_category_array
    gon.basis_percent_array = @basis_percent_array
    gon.basis_color_array = @basis_color_array
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
    redirect_to schedules_path, notice: 'Schedule was successfully deleted.', status: :see_other
  end

  private

    def set_q
      @q = Schedule.where(user_id: current_user.id).includes(:user).ransack(params[:q])
    end

    def schedule_params
      params.require(:schedule).permit(:title, :pattren)
    end

    def set_schedule
      @schedule = current_user.schedules.find(params[:id])
    end
end
