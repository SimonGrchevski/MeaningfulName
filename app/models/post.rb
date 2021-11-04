class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  def self.update_post_counter(param)
    @user = User.find_by_name(param[:user])
    @user.update(postcounter: param[:update_to])
  end

  def self.last_comments(post_id)
    Post.find_by_id(post_id).comments.limit(5).order(created_at: :desc)
  end
end
