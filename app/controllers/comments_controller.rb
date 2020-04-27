class CommentsController < ApplicationController
  before_action :find_commentable, only: [:create]
  before_action :set_comment, except: [:create]
  before_action :authenticate_user!


  def create
    @comment = @commentable.comments.build(comment_params)
    @comment.user = current_user
    @comment.reply = true if params[:comment_id]
    @comment.save

  end

 

  def destroy
    @comment.destroy
  end


  private
  def find_commentable
    if params[:comment_id]
      @commentable = Comment.find_by_id(params[:comment_id])
    elsif params[:post_id]
      @commentable = Post.friendly.find(params[:post_id])
    end
  end

  def comment_params
    params.require(:comment).permit(:body)
  end


  def set_comment
    @comment = Comment.find(params[:id])
  end




end
