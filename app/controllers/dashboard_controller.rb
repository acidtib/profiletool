class DashboardController < ApplicationController

  before_filter :authenticate_user!
 
  def index
    if current_user.website.nil?
      redirect_to new_website_path, :notice => "Setup your website!"
    else
      @website = current_user.website
      if @website.website_pages_enabled?
        @pages = @website.website_pages.all
      end
    end
  end

end

