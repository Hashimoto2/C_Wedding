class Admins::ArticlesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @article = Article.all
  end

  def show
    @article = Article.find(params[:id])
    #@comment = Comment.find(params[:id])
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
