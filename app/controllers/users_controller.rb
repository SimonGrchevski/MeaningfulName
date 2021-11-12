class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def show
    @user = current_user
    @posts = User.last_posts(current_user.name)
  end
end
