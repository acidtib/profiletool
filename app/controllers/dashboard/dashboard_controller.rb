class Dashboard::DashboardController < ApplicationController

  before_filter :authenticate_user!
 
  def index
    if current_user.website.nil?
      redirect_to dashboard_website_path, :notice => "Setup your website!"
    else
      @website = current_user.website
    end
  end

end

