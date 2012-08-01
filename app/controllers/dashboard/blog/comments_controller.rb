class Dashboard::Blog::CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(params[:comment])
    @comment.save

    redirect_to [:dashboard, :blog, @post]
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to [:dashboard, :blog, @comment.post]
  end
end
