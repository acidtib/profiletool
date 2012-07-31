class Dashboard::Blog::CommentsController < ApplicationController
  def create
    @dashboard_blog_post = Dashboard::Blog::Post.find(params[:post_id])
    @comment = @dashboard_blog_post.comments.build(params[:comment])
    @comment.save

    redirect_to @dashboard_blog_post
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to @comment.post
  end
end
