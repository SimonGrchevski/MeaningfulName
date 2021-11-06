module PostsHelper
  def render_comments(comments)
    comments.order('id desc').limit(5)
  end
end
