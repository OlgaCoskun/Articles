class LikeController < ApplicationController
  belongs_to :comment

  def create
    @comment = params[:comment_id]
    likes = {comment_id: @comment}
    @likes = Like.new(likes)
    if @like.save
      redirect_to comment_path
    end
  end

  private

  def like_params
    params.require(:likes).permit(:comment_id)
  end
end
