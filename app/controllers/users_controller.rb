class UsersController < ApplicationController

  before_filter :authenticate_user!
  before_filter :load_user

  def show
  end

  def create
  end

  def edit
  end

  def update
    if @user.update_attributes(params[:user])
      redirect_to dashboard_user_path, :notice => "Your profile has been updated!"
    else
      render action: 'edit'
    end
  end

  def destroy
  end

end
