class PostsController < ApplicationController
  def index
    Post.update_post_counter(current_user:current_user.name, update_to:10)
    @posts = Post.last_comments(1)
  end

  def show; end
end
