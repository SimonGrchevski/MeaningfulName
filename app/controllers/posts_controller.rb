class PostsController < ApplicationController
  def index
    @user = User.find_by_id(params[:user_id])
    @posts = @user.posts
  end

  def show
    @post = Post.find_by_id(params[:id])
    @comments = Post.last_comments(params[:id])
  end
end
