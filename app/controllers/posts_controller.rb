class PostsController < ApplicationController
  def index
    @user = current_user
    @posts = Post.all.includes([:user])
    @post = Post.new
  end

  def show
    @post = Post.find_by_id(params[:id])
    @comments = @post.comments.includes([:user])
    @comment = Comment.new
    @like = Like.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:notice] = 'Post successfully created'
    else
      flash[:alert] = 'Creation failed'
    end
    redirect_to request.referrer
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to request.referrer, notice: 'Your post has been deleted'
  end

  private

  def post_params
    params.require(:post).permit(:text, :commentscounter, :likescounter)
  end
end
