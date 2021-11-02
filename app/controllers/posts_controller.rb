class PostsController < ApplicationController
  def index
    Post.update_post_counter(user:current_user.name, update_to:current_user.posts.count)
    @posts = Post.last_comments(1)
  end

  def show; end
end
