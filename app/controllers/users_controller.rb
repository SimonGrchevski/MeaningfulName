class UsersController < ApplicationController
  def index
    @user = User.last_posts(current_user.name)
  end

  def show; end
end
