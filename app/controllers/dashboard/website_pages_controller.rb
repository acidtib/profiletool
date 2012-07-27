class Dashboard::WebsitePagesController < ApplicationController
  
  before_filter :authenticate_user!
  before_filter :load_website
  # GET /website_pages
  # GET /website_pages.json

  def index
    @website_pages = @website.website_pages.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @website_pages }
    end
  end

  # GET /website_pages/1
  # GET /website_pages/1.json
  def show
    @website_page = @website.website_pages.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @website_page }
    end
  end

  # GET /website_pages/new
  # GET /website_pages/new.json
  def new
    @website_page = WebsitePage.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @website_page }
    end
  end

  # GET /website_pages/1/edit
  def edit
    @website_page = @website.website_pages.find(params[:id])
  end

  # POST /website_pages
  # POST /website_pages.json
  def create
    @website_page = @website.website_pages.new(params[:website_page])
    
    respond_to do |format|
      if @website_page.save
        format.html { redirect_to [:dashboard, @website_page], notice: 'Website page was successfully created.' }
        format.json { render json: @website_page, status: :created, location: @website_page }
      else
        format.html { render action: "new" }
        format.json { render json: @website_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /website_pages/1
  # PUT /website_pages/1.json
  def update
    @website_page = @website.website_pages.find(params[:id])

    respond_to do |format|
      if @website_page.update_attributes(params[:website_page])
        format.html { redirect_to [:dashboard, @website_page], notice: 'Website page was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @website_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /website_pages/1
  # DELETE /website_pages/1.json
  def destroy
    @website_page = @website.website_pages.find(params[:id])
    @website_page.destroy

    respond_to do |format|
      format.html { redirect_to dashboard_website_pages_url }
      format.json { head :no_content }
    end
  end

  protected
  def load_website
    if current_user 
      @website = current_user.website
    end
  end
end
