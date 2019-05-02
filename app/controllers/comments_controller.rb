class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.user_id = current_user.id if current_user

    if @comment.save
      CommentMailer.new_comment(@comment).deliver_now
      flash[:success] = "The comment has been saved"
      redirect_to post_path(@post)
    else
      flash[:danger] = "There was a problem saving the comment"
    end
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    if @comment.update(comment_params)
      flash[:success] = "The comment has been updated"
      redirect_to post_path(@post)
    else
      flash[:danger] = "There was a problem saving the comment"
      render 'edit'
    end
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    flash[:warning] = "The comment has been deleted"
    redirect_to post_path(@post)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end