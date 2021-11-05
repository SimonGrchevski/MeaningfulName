class PostsController < ApplicationController
  def index
    @user = User.find_by_id(params[:user_id])
    @posts = @user.posts.order('id desc')
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
      redirect_to request.referrer 
      flash[:notice] = "Post successfully created"
    else 
      redirect_to request.referrer 
      flash[:alert] = "Creation failed" 
    end
  end

  private

  def post_params
    params.require(:post).permit(:text, :commentsCounter, :likesCounter)
  end
end
