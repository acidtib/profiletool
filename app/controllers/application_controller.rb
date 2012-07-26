class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def current_user
    begin
    if !session[:user_id].nil?
      @user = User.find(session[:user_id])
    else
      false
    end
    rescue Exception => e
      reset_session 
      false
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
    Rails.logger.info "Authenticating... #{session.to_s}"
    if session[:user_id].nil?
      redirect_to new_user_session_path, :notice => "Not this time."
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
