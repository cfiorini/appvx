module ApplicationHelper

  def destroy_devise_session_path
    if current_admin
      destroy_admin_session_path
    elsif current_reseller
      destroy_reseller_session_path
    else
      nil
    end
  end

  def devise_signed_in?
    current_admin || current_reseller ? true : false
  end

end
