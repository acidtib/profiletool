class PublicController < ApplicationController

  layout "public"
  
  def path
    render :text => "<pre>#{JSON.pretty_generate(JSON.parse({ :params => params, :request => request.domain }.to_json))}</pre>" 
  end

  def root 
    @website = Website.find_by_domain(request.domain)
    if @website.nil?
      render :text => "404"
    else
      @user = @website.user
    end
  end

end
