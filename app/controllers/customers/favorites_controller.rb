class Customers::FavoritesController < ApplicationController
  before_action :authenticate_customer!

  def create
    @article = Article.find(params[:article_id])
    favorite = @article.favorites.new(customer_id: current_customer.id)
    favorite.save
  end

  def destroy
    @article = Article.find(params[:article_id])
    favorite = @article.favorites.find_by(customer_id: current_customer.id)
    favorite.destroy
  end
end
