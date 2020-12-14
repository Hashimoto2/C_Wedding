class Customers::CommentsController < ApplicationController

  def index
    @article = Article.all
    #@customer = Customer.find(params[:id])
  end

  def create
  end

  def update
  end

  def destroy
  end

end
