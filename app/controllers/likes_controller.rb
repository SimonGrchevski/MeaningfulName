class LikesController < ApplicationController
  def index
    Like.update_like_counter({post_id: 1, update_to: 3})
  end
end
