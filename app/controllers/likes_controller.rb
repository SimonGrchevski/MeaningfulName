class LikesController < ApplicationController
  def index
    Like.update_like_counter({ post_id: 1, update_to: 3 })
  end

  def new
    @like = Like.new(like_params)
  end

  def create
    @like = Like.create(like_params)
    redirect_to request.referrer if @like.save
  end

  private

  def like_params
    params.require(:like).permit(:user_id, :post_id)
  end
end
