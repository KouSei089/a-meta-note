class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  # include DemoUserModule

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

  # def demo_login
  #   @demo_user = User.demo_user_create
  #   categories_create
  #   schedule_basis_create
  #   schedule_create
  #   auto_login(@demo_user)
  #   redirect_to schedules_path, notice: 'You logged in as a guest'
  # end

  def destroy
    logout
    redirect_to root_path, notice: 'Logged out!'
  end
end
