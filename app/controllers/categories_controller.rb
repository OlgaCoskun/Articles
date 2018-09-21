class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  # POST /posts
  def create
    @category = Category.new(category_params)
  end

  private

  def category_params
    params.require(:category).permit(:topic)
  end
end
