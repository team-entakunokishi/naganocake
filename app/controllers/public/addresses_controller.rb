class Public::AddressesController < ApplicationController

  def index
    @customer = current_customer
    @address = Address.new
    @addresses = Address.all
  end

  def create
    @customer = current_customer
    @address = Address.new(address_params)
    @address.customer_id = @customer.id
    if
      @address.save
      redirect_to public_addresses_path
    else
      @addresses = Address.all
      render 'index'
    end

  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    if
      @address.update(address_params)
      redirect_to public_addresses_path
    else
      @addresses = Address.all
      render 'edit'
    end
  end

  def destroy
    address = Address.find(params[:id])
    address.destroy
    redirect_to public_addresses_path
  end

  private

  def address_params
    params.require(:address).permit(:shipping_code, :shipping_address, :post_name)
  end

end
