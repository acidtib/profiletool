class UserSessionController < ApplicationController

  def new

  end

  def create
    user = authenticate_user(params[:auth][:email], params[:auth][:password])
    if user
      redirect_to dashboard_root_path, :notice => "Hello!"
    else
      redirect_to new_user_session_path, :notice => "Try again."
    end
  end

  def destroy

  end

  protected
  def authenticate_user(email, password)
    @user = User.find_by_email(email)
    if @user && @user.authenticate(password)
      session[:user_id] = @user.id
      return @user
    else
      if session[:login_attempts] 
        session[:login_attempts] = session[:login_attempts] + 1
      else
        session[:login_attempts] = 1
      end
      return false
    end
  end


end
