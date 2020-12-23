class Customers::CommentsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @articles = Article.all
    @customer = Customer.find(params[:id])
  end

  def create
    @article = Article.find(params[:article_id])
    @comment = current_customer.comments.new(comment_params)
    @comment.article_id = @article.id
    @categories = Category.all
    @comment.article_id = @article.id

    if @comment.save
     redirect_to customers_article_path(@article)
    else
     render "customers/articles/show"
    end
  end

  def edit
  @article = Article.find(params[:article_id])
  @comment = Comment.find(params[:id])
  end

  def update
  @article = Article.find(params[:article_id])
  @comment = Comment.find(params[:id])

    if @comment.update(comment_params)
     redirect_to customers_article_path(@article.id)
    else
     render "edit"
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    comment = Comment.find(params[:id])
    comment = current_customer.comments.find_by(id: params[:id], article_id: @article.id)
    comment.destroy
    redirect_to customers_article_path(@article.id)
  end

   private
  def comment_params
    params.require(:comment).permit(:comment, :rate )
  end
end
