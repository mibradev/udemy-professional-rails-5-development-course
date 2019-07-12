module ApplicationHelper
  def login_helper
    unless user_signed_in?
      link_to('Login', new_user_session_path) +
      " " +
      link_to('Signup', new_user_registration_path)
    else
      link_to 'Logout', destroy_user_session_path, method: :delete
    end
  end
end
