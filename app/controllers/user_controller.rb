class UserController < ApplicationController

  def new
    if current_user
      redirect_to dashboard_root_path, :notice => "You've already got an account!"
    else
      @user = User.new
    end
  end


  def create
    @user = User.new(params[:user])
    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to dashboard_root_path, :notice => "Account created successfully!" }
        format.json { render json: @user, status: created, location: @user }
      else 
        format.html { render action: "new" }
      end
    end
  end
end

