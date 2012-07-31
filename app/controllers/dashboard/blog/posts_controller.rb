class Dashboard::Blog::PostsController < ApplicationController
  # GET /dashboard/blog/posts
  # GET /dashboard/blog/posts.json
  def index
    @dashboard_blog_posts = Dashboard::Blog::Post.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @dashboard_blog_posts }
    end
  end

  # GET /dashboard/blog/posts/1
  # GET /dashboard/blog/posts/1.json
  def show
    @dashboard_blog_post = Dashboard::Blog::Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @dashboard_blog_post }
    end
  end

  # GET /dashboard/blog/posts/new
  # GET /dashboard/blog/posts/new.json
  def new
    @dashboard_blog_post = Dashboard::Blog::Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @dashboard_blog_post }
    end
  end

  # GET /dashboard/blog/posts/1/edit
  def edit
    @dashboard_blog_post = Dashboard::Blog::Post.find(params[:id])
  end

  # POST /dashboard/blog/posts
  # POST /dashboard/blog/posts.json
  def create
    @dashboard_blog_post = Dashboard::Blog::Post.new(params[:dashboard_blog_post])

    respond_to do |format|
      if @dashboard_blog_post.save
        format.html { redirect_to @dashboard_blog_post, notice: 'Post was successfully created.' }
        format.json { render json: @dashboard_blog_post, status: :created, location: @dashboard_blog_post }
      else
        format.html { render action: "new" }
        format.json { render json: @dashboard_blog_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /dashboard/blog/posts/1
  # PUT /dashboard/blog/posts/1.json
  def update
    @dashboard_blog_post = Dashboard::Blog::Post.find(params[:id])

    respond_to do |format|
      if @dashboard_blog_post.update_attributes(params[:dashboard_blog_post])
        format.html { redirect_to @dashboard_blog_post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @dashboard_blog_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dashboard/blog/posts/1
  # DELETE /dashboard/blog/posts/1.json
  def destroy
    @dashboard_blog_post = Dashboard::Blog::Post.find(params[:id])
    @dashboard_blog_post.destroy

    respond_to do |format|
      format.html { redirect_to dashboard_blog_posts_url }
      format.json { head :no_content }
    end
  end
end
