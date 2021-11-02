class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_save :update_comment_counter

  private
  def self.update_comment_counter(param)
    @post = Post.find_by_id(param[:post_id])
    @post.update(commentsCounter: param[:update_to])
  end
end
