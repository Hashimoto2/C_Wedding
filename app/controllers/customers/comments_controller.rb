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
    @comments = @article.comments

    if @comment.save
     redirect_to customers_article_path(@article)
    else
     @article_url = "https://#{ENV['AWS_S3_BUCKET_NAME']}-resize.s3.amazonaws.com/store/#{@article.image_id.to_s}-thumbnail."
     @article_url2 = "https://#{ENV['AWS_S3_BUCKET_NAME']}-resize.s3.amazonaws.com/store/#{@article.image2_id.to_s}-thumbnail."
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
