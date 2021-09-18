class Admins::CustomersController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @customers = Customer.All
  end
  
  def show
    @customer = Customer.find(params[:id])
  end
  
  def edit
    @customer = Customer.find(params[:id])
  end
  
  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)



      #正しいルートパスがまだ存在しないーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー
      redirect_to edit_customer_registration_path
    else
      render  :edit
    end
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:front_name, :back_name, :first_name, :last_name, :email, :post_code, :address, :tel_number, :is_customer_status)
  end
end
