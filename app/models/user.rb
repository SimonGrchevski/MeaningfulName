class User < ApplicationRecord
  validates :name, presence: true, length:{ minimum: 5, maximum:25}
  validates :postcounter ,numericality: { only_integer: true, greater_than: 0 }
  has_many :posts
  has_many :likes
  has_many :comments

  def self.last_posts(user_name)
    User.find_by_name(user_name).posts.limit(3).order(created_at: :desc)
  end
end
