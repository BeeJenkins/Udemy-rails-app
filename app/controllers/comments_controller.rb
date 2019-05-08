class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.user_id = current_user.id if current_user
    @user = current_user

    if @comment.save
      CommentMailer.new_comment(@comment).deliver_now
      flash[:success] = "The comment has been saved"
      redirect_to post_path(@post)
    else
      flash[:danger] = "#{@user.first_name}," + @comment.errors.full_messages.to_sentence
      redirect_to post_path(@post)
    end
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    if @comment.update(comment_params)
      flash[:success] = "The comment has been updated"
      redirect_to post_path(@post)
    else
      flash[:danger] = "#{@comment.user.first_name}," + @comment.errors.full_messages.to_sentence
      redirect_back(fallback_location: root_path)
    end
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    is_not_comment_owner
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    if current_user == @comment.user
      @comment.destroy
      flash[:warning] = "The comment has been deleted"
      redirect_to post_path(@post)
    else
      flash[:danger] = "You do not own"
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def is_not_comment_owner
    if current_user != @comment.user
      flash[:danger] = "You do not own"
      redirect_back(fallback_location: root_path)
    end
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end