class PostsController < ApplicationController
  def index
    @user = User.find_by_id(params[:user_id])
    @posts = @user.posts.order('id desc')
    @post = Post.new
  end

  def show
    @post = Post.find_by_id(params[:id])
    @comments = Post.last_comments(params[:id])
    @comment = Comment.new
    @like = Like.new
  end

  def create
    @post = current_user.posts.build(post_params)
    redirect_to request.referrer if @post.save
  end

  private

  def post_params
    params.require(:post).permit(:text)
  end
end
