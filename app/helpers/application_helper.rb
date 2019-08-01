module ApplicationHelper
  def navbar_items
    items = [
      { name: 'Home', path: root_path },
      { name: 'About', path: about_me_path },
      { name: 'Contact', path: contact_path },
      { name: 'Blog', path: blogs_path },
      { name: 'Portfolio', path: portfolios_path }
    ]

    unless user_signed_in?
      items.push(
        { name: 'Login', path: new_user_session_path },
        { name: 'Signup', path: new_user_registration_path }
      )
    else
      items << { name: 'Logout', path: destroy_user_session_path, method: :delete }
    end
  end
end
