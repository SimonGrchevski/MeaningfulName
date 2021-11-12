class Post < ApplicationRecord
  validates :text, presence: true, length: { maximum: 250 }
  validates :commentscounter, :likescounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  belongs_to :user
  has_many :comments, dependent: :delete_all
  has_many :likes, dependent: :delete_all

  def self.update_post_counter(param)
    @user = User.find_by_name(param[:user])
    @user.update(postcounter: param[:update_to])
  end

  def self.last_comments(post_id)
    Post.find_by_id(post_id).comments.limit(5).order(created_at: :desc)
  end
end
