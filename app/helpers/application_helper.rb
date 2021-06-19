module ApplicationHelper
  def display_msg
    concat content_tag(:p, alert, class: 'alert') if alert.present?
    content_tag(:p, notice, class: 'notice') if notice.present?
  end

  def navbar_link_name
    link_to current_user.name, class: 'navbar-link logout-btn' if logged_in?
  end

  def navbar_button_logout
    return unless logged_in?

    button_to 'Logout', logout_path, { method: :delete, data: { confirm: 'Are you sure?' }, class: ' last-btn' }
  end

  def navbar_link_sign_up
    link_to 'Sign Up', new_user_path, class: 'navbar-link logout-btn' unless logged_in?
  end

  def navbar_link_login
    link_to 'Login |', login_path, class: 'navbar-link logout-btn' unless logged_in?
  end

  private

  def logged_in?
    !current_user.nil?
  end
end
