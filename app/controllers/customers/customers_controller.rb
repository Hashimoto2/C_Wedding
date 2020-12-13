class Customers::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :encrypted_password, :profile_image, :is_deleted )
  end

end
