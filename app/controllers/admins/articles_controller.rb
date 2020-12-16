class Admins::ArticlesController < ApplicationController

  def index
    @article = Article.all
  end

  def new
    @article = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.all
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

    private
  def article_params
    params.require(:article).permit(:title, :introduction, :image )
  end

end
