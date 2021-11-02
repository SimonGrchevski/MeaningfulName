class PostsController < ApplicationController
  def index
    @posts = User.find_by_id(params[:user_id]).posts
  end

  def show
    @post = Post.find_by_id(params[:id])
  end
end
