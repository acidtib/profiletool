class ApplicationController < ActionController::Base
  protect_from_forgery

  def logout
    session.delete(:is_admin)
    redirect_to root_path, :notice => "may the force be with you!"
  end

  def auth
  end

  def auth_post
    fails = session[:auth_fails]

    if params[:authentication][:password] == "stayhungrystayfoolishthomas"
      session[:is_admin] = true
      redirect_to root_path, :notice => "Hello Thomas"
    else
      if !fails
        session[:auth_fails] = 1
        redirect_to auth_get_path, :notice => "2 attempts left."
      else
        if fails < 3 
          session[:auth_fails] = fails + 1
          redirect_to auth_get_path, :notice => "You have #{3-fails} attempts left."
        else
          redirect_to root_path, :notice => "nah. not this time buster."
        end
      end
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
