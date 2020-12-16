class Customers::FavoritesController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    favorite = @article.favorites.new(customer_id: current_customer.id)
    favorite.save
    redirect_to customers_articles_path
  end

  def destroy
    @article = Article.find(params[:article_id])
    favorite = @article.favorites.find_by(customer_id: current_customer.id)
    favorite.destroy
    redirect_to customers_articles_path
  end
end
