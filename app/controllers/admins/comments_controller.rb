class Admins::CommentsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @articles = Article.all
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to admins_comments_path
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
