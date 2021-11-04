class PostsController < ApplicationController
  def index
    @user = User.find_by_id(params[:user_id])
    @posts = @user.posts.order('id desc')
    @post = Post.new
  end

  def show
    @post = Post.find_by_id(params[:id])
    @comment = Comment.new
    @like = Like.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save 
      redirect_to request.referrer
    end
  end

  private
  def post_params
    params.require(:post).permit(:text)
  end  

end
