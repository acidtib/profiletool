module ApplicationHelper
  def is_admin?
    if session[:is_admin]
      true
    else
      false
    end
  end
end
