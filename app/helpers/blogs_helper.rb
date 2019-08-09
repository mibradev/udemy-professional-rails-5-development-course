module BlogsHelper
  def comments_pagination
    link_to_next_page @comments, 'More', param_name: :comment_page, remote: true
  end
end
