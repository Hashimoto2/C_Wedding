class Customers::CommentsController < ApplicationController

  def index
    @articles = Article.all
    @customer = Customer.find(params[:id])
  end

  def create
    @article = Article.find(params[:article_id])
    comment = current_customer.comments.new(comment_params)
    comment.article_id = @article.id
    comment.save
    redirect_to customers_article_path(@article)
  end

  def update
  end

  def destroy
    @article = Article.find(params[:article_id])
    comment = current_customer.comments.find_by(id: params[:id], article_id: @article.id)
    comment.destroy
  end

   private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end