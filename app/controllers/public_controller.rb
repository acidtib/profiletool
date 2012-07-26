class PublicController < ApplicationController

  layout "public"

  def app_homepage
    render :template => 'public/app_homepage', :layout => "application"
  end

  def path
    render :text => "<pre>#{JSON.pretty_generate(JSON.parse({ :params => params, :request => request.domain }.to_json))}</pre>" 
  end

  def root 
    @website = Website.find_by_domain(request.domain)
    if @website.nil?
      render :text => "404"
    else
      @user = @website.user
      if @website.homepage.nil?
        render 'public/no_page_set'
      else
        render :inline => @website.homepage.body_markdown, :layout => "public_basic"
      end
    end
  end

end
