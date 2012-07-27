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
    render :text => "<pre>#{JSON.pretty_generate(JSON.parse({ :params => params, :request => request.domain }.to_json))}</pre>" 
  end

  def root 
    @website = Website.find_by_domain(request.domain)
    if @website.nil?
      render :text => "404"
    else
      @user = @website.user
      homepage = @website.get_homepage
      if homepage
        @html = homepage.body_html
        render 'public/page_template'
      else
        render 'public/no_page_set'
      end
    end
  end

end
