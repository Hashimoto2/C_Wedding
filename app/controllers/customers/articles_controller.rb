class Customers::ArticlesController < ApplicationController

  def top
    @categories = Category.all
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
    @categories = Category.all
  end

  def create
    @article = Article.new(article_params)
    if @article.save!
       redirect_to thanx_path
    else
       render "new"
    end
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
    @categories = Category.all
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

  def destroy
    @article = Article.all
    @article.destroy
    redirect_to mypage_path(current_customer)
  end

  private
  def article_params
    params.require(:article).permit(:title, :introduction, :image, :category_id)
  end
end

# Hash - key/value
# {"article" => {"title" => "hoge", "introduction" => "hogehogehoge", "image" => "lfsjdalfjlsdfjalf"}}
