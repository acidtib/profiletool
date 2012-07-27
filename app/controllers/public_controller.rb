class PublicController < ApplicationController

  layout "public"

  def app_homepage
    if current_user
      redirect_to dashboard_root_path
    else
      render :template => 'public/app_homepage', :layout => "application"
    end
  end

  def path
    @website = Website.find_by_domain(request.domain)
    if @website.nil?
      render :text => "404"
    else
      @user = @website.user
      @page = @website.website_pages.find_by_path(params[:other])
      if @page.nil?
        render :text => "404 page not found, get outta here homie.", :status => 404
      else
        @html = @page.body_html
        render 'public/page_template'
      end
    end
  end

  def root 
    @website = Website.find_by_domain(request.domain)
    if @website.nil?
      render :text => "404"
    else
      @user = @website.user
      @page = @website.get_homepage
      if @page
        @html = @page.body_html
        render 'public/page_template'
      else
        render 'public/no_page_set'
      end
    end
  end

end
