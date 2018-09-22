class CategoriesController < ApplicationController
  before_action :set_post, only: [:create, :destroy]
  before_action :set_category, only: [:destroy]

  def new
    @category = Category.new
  end

  # POST /posts
  def create
    # @category = Category.new(category_params)
    @add_category = @post.categories.build(category_params)
    @add_category.reload if @add_category.save

  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_category
    @category = @post.categories.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:topic)
  end
end
