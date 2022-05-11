class CategoriesController < ApplicationController
  before_action :set_category, only: [:edit, :update, :destroy]
  def index
    @categories = Category.all
    @category = Category.new
  end

  def create
    @category = current_user.categories.build(category_params)
    if @category.save
      redirect_to categories_path
    else
      @categories = Category.all
      render :new
    end
  end

  def edit; end

  def update
    if @category.update(category_params)
      redirect_to categories_path
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path
  end

  private

    def set_category
      @category = current_user.categories.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name, :color, :color_code)
    end
end
