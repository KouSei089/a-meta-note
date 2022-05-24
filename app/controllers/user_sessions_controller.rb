class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create, :demo_login]

  def new; end

  def create
    @user = login(params[:email], params[:password])

    if @user
      redirect_back_or_to schedules_path, notice: 'Login successful'
    else
      flash.now[:alert] = 'Login failed'
      render :new
    end
  end

  def demo_login
    @demo_user = User.demo_user_create
    categories_create
    schedule_basis_create
    schedule_create
    auto_login(@demo_user)
    redirect_to schedules_path, notice: 'You logged in as a guest'
  end

  def destroy
    logout
    redirect_to root_path, notice: 'Logged out!'
  end

  private

    def categories_create
      Category.create!(
        user_id: @demo_user.id,
        name: "Programming",
        color: "green",
        color_code: "rgb(8, 166, 63, 0.5)"
      )
      Category.create!(
        user_id: @demo_user.id,
        name: "Routine",
        color: "blue",
        color_code: "rgb(3, 103, 166, 0.5)"
      )
      Category.create!(
        user_id: @demo_user.id,
        name: "Brainstorming",
        color: "red",
        color_code: "rgb(217, 50, 50, 0.5)"
      )
    end

    def schedule_basis_create
      num = 1
      ScheduleBasis.create!(
        user_id: @demo_user.id,
        title: "Standard",
        pattren: "weekday"
      )
      5.times do
        category = Category.find(rand(1..3))
        TaskBasis.create!(
          user_id: @demo_user.id,
          schedule_basis_id: 1,
          title: "DemoData",
          time_start: "Sat, 01 Jan 2000 12:00:00.000000000 JST +09:00",
          time_end: "Sat, 01 Jan 2000 14:00:00.000000000 JST +09:00",
          category_name: category.name,
          percent: rand(5..20)
        )
        CategoryTaskBasis.create!(
          task_basis_id: num,
          category_id: category.id
        )
        num += 1
      end
    end

    def schedule_create
      num = 1
      Schedule.create!(
        user_id: @demo_user.id,
        title: "Mon, 23 May 2022",
        pattren: "weekday"
      )
      5.times do
        category = Category.find(rand(1..3))
        Task.create!(
          user_id: @demo_user.id,
          schedule_id: 1,
          title: "DemoData",
          time_start: "Sat, 01 Jan 2000 12:00:00.000000000 JST +09:00",
          time_end: "Sat, 01 Jan 2000 14:00:00.000000000 JST +09:00",
          category_name: category.name,
          percent: rand(5..20)
        )
        TaskCategory.create!(
          task_id: num,
          category_id: category.id
        )
        num += 1
      end
    end
end
