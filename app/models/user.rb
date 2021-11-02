class User < ApplicationRecord
  has_many :posts
  has_many :likes
  has_many :comments

  def self.last_posts(user_name)
    User.find_by_name(user_name).posts.limit(3).order(created_at: :desc)
  end
end
