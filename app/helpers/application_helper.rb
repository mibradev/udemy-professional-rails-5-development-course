module ApplicationHelper
  def login_helper(html_class: '')
    unless user_signed_in?
      link_to('Login', new_user_session_path, class: html_class) +
      " " +
      link_to('Signup', new_user_registration_path, class: html_class)
    else
      link_to('Logout', destroy_user_session_path, method: :delete, class: html_class)
    end
  end

  def utm_source_helper
    if session[:utm_source]
      content_tag(:p, "Thanks for visiting from #{session[:utm_source]}", class: 'utm-source-greeting')
    end
  end

  def copyright_generator
    "Ⓒ #{Time.current.year} MibraDev"
  end
end
