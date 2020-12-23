class Customers::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
    @customer = Customer.find(params[:id])
    article_id_list = Favorite.where(customer_id: @customer.id).select(:article_id)
    @articles = Article.where(id: article_id_list)
  end

  def mypage
    @customer = Customer.find(params[:id])
    @article = Article.all
  end

  def create
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to  customers_customer_path(current_customer.id), notice: "会員情報が更新されました。"
    else
      render "edit"
    end
  end

  def destroy
    current_customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end

  def quit
  end

  def out
  end

  def articles
    @customer = Customer.find(params[:id])
    @articles = Article.joins(:comments).where('comments.customer_id = ?', params[:id])
  end

  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :encrypted_password, :profile_image, :is_deleted )
  end

end
