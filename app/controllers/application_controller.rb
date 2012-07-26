class ApplicationController < ActionController::Base
  protect_from_forgery



  def current_user
    if session[:user_id]
    @user = User.find(session[:user_id])
    else
      @user = nil
    end
  end

  def load_user
    @user = User.find(session[:user_id])
    if @user.nil?
      redirect_to new_user_session_path
    end
  end

  def chooser
    if request.subdomain != ""
      100.times do 
        Rails.logger.info request.subdomain
      end
    else
      redirect_to dashboard_path
    end
  end

  def authenticate_user!
    if session[:user_id]
      return true
    else
      redirect_to new_user_session_path, :notice => "Not this time buster."
    end
  end

  def is_admin?
    if session[:is_admin] 
      true
    else
      false
    end
  end

  def verify_admin!
    if !is_admin?
      redirect_to root_path, :notice => "You're not authenticated."
    end
  end

end
