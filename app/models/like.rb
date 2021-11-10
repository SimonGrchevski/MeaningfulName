class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  # def self.update_like_counter(param)
  #   @post = Post.find_by_id(param[:post_id])
  #   @post.update(likesCounter: param[:update_to])
  # end
end
