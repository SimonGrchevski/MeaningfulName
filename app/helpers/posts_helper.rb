module PostsHelper
  def render_comments(comments)
    comments.limit(5).order('id desc')
  end
end
