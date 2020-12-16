class Customers::ArticlesController < ApplicationController

  def top
  end

  def about
  end

  def thanx
  end

  def new
    @article = Article.new
  end

  def index
    @article = Article.all
  end

  def create
    @article = Article.new(article_params)
    if @article.save!
       redirect_to thanx_path
    else
       render "new"
    end

    # @comment = Comment.new
    # @comment.customer_id = current_customer.id
    # if @comment.save
    #   redirect_to comment_path(current_customer)
    # else
    #   @comments = Comment.all
    #   render "index"
    # end
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to customers_articles_path
    else
      render "edit"
    end
  end

  private
  def article_params
    params.require(:article).permit(:title, :introduction, :image)
  end
end

# Hash - key/value
# {"article" => {"title" => "hoge", "introduction" => "hogehogehoge", "image" => "lfsjdalfjlsdfjalf"}}
