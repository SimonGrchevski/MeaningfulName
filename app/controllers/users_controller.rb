class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = User.last_posts(current_user.name)
  end
end
