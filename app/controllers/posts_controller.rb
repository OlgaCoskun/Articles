class PostsController < ApplicationController
  before_action :set_post, only: [:publish, :send_to_moderator, :take_from_moderator, :show, :edit, :update, :destroy]

  # GET /posts
  def index
    @posts = Post.all
  end

  def send_to_moderator
    @post.moderator_has = true
    redirect_to root_path, notice: 'Your post has been sent to moderator' if @post.save
  end

  def take_from_moderator
    @post.moderator_has = false
    redirect_to root_path, notice: 'Your post has been back from moderator' if @post.save
  end

  def publish
    if @post.link != '' && @post.category.topic != ''  # тут наверно как то красивее можно написать, пробовала blank? present?
      @post.update(publish: true)
      redirect_to post_path(@post), notice: 'Пост выставлен'
    else
      redirect_to post_path(@post), notice: 'Нужен линк и категория'
    end
  end

  # GET /posts/1
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
    @post.build_category
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :link, category_attributes: [:topic])
  end
end
