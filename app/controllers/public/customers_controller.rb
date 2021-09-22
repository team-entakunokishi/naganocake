class Public::CustomersController < ApplicationController

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    @customer.update(customer_params)
    redirect_to public_customers_path
  end

  def confirm

  end

  def withdraw

  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:front_name, :back_name, :first_name, :last_name, :post_code, :tel_number, :email)
  end


end
