class CategoriesController < ApplicationController
  before_action :set_category, only: [:edit, :update, :destroy]
  before_action :set_categories, only: [:index, :edit]

  def index
    @category = Category.new
  end

  def create
    @category = current_user.categories.build(category_params)
    colors = Color.all
    @colors_select = colors.select { |color| color.name == @category.color }
    @category.color_code = @colors_select[0].color_num
    if @category.save
      redirect_to categories_path, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @category.update(category_params)
      colors = Color.all
      @colors_select = colors.select { |color| color.name == @category.color }
      @category.color_code = @colors_select[0].color_num
      if @category.save
        redirect_to categories_path, notice: 'Category was successfully updated.'
      else
        render :edit
      end
    else
      render :edit
    end
  end

  def destroy
    category_tasks = @category.tasks.each { |task| task.category_name = "Untitled" }
    if category_tasks.each(&:save)
      @category.destroy
      redirect_to categories_path, notice: 'Category was successfully deleted.'
    else
      render :index
    end
  end

  private

    def set_category
      @category = current_user.categories.find(params[:id])
    end

    def set_categories
      @categories = Category.all
    end

    def category_params
      params.require(:category).permit(:name, :color, :color_code)
    end
end
