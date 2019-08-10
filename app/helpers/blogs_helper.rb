module BlogsHelper
  def comments_pagination
    link_to_next_page @comments, 'More', param_name: :comment_page, remote: true
  end

  def status_button_class(status)
    ['btn btn-sm', { draft: 'btn-secondary', published: 'btn-success' }[status.to_sym]]
  end
end
