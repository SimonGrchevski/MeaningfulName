class CommentsController < ApplicationController
  def index
    Comment.update_comment_counter(post_id:1, update_to:15)
  end

end
