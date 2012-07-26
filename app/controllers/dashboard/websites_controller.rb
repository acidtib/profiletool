class Dashboard::WebsitesController < ApplicationController
  before_filter :authenticate_user!

  # GET /websites/1
  # GET /websites/1.json
  def show
    @website = current_user.website
    if @website.nil?
      redirect_to new_dashboard_website_path, :notice => "Setup your website!"
    else
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @website }
      end
    end
  end

  # GET /websites/new
  # GET /websites/new.json
  def new
    @website = Website.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @website }
    end
  end

  # GET /websites/1/edit
  def edit
    @website = current_user.website
  end

  # POST /websites
  # POST /websites.json
  def create
    @website = Website.new(params[:website])
    @website.user = current_user
    respond_to do |format|
      if @website.save
        format.html { redirect_to [:dashboard, :website], notice: 'Website was successfully created.' }
        format.json { render json: @website, status: :created, location: @website }
      else
        format.html { render action: "new" }
        format.json { render json: @website.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /websites/1
  # PUT /websites/1.json
  def update
    @website = current_user.website 

    respond_to do |format|
      if @website.update_attributes(params[:website])
        format.html { redirect_to [:dashboard, :website], notice: 'Website was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @website.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /websites/1
  # DELETE /websites/1.json
  def destroy
    @website = current_user.website
    @website.destroy

    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { head :no_content }
    end
  end
end
