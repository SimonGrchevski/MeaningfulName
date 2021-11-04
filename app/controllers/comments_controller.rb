class CommentsController < ApplicationController
  def index
    Comment.update_comment_counter({ post_id: 1, update_to: 15 })
  end

  def create
    @comment = Comment.create(comment_params)
    if @comment.save 
      redirect_to request.referrer
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text,:user_id, :post_id)
  end
end
