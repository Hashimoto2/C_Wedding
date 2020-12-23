class Admins::ArticlesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @article = Article.all
  end

  def new
    @article = Article.new
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.find(params[:id])
  end

  def create
    @article = Article.new(article_params)
    if @article.save
     redirect_to admins_articles_path
    else
     render "new"
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
     redirect_to admins_articles_path
    else
     render "edit"
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to admins_articles_path
  end

  private
  def article_params
    params.require(:article).permit(:title, :introduction, :image, :category_id )
  end

end
