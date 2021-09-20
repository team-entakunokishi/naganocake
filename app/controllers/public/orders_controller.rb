class Public::OrdersController < ApplicationController
   before_action :authenticate_customer!

   def new
     @order = Order.new
		 @shipping_addresses = current_customer.addresses
   end
    def confilm
      @order = Order.new(order_params)
      @order.customer_id = current_customer.id
        #addresにaddresが入っていた場合
if params[:order_address] == "option1"
         @order.shipping_code = current_customer.shipping_code
         @order.address = current_customer.address
         @order.name = current_customer.last_name + current_customer.first_name
      　#addresにshipping_addresが入っていた場合
elsif params[:order_address] == "option2"
			   @address = Address.find(params[:order][:select_address])
			   @order.shipping_address = @address.shipping_address
			   @order.name = @address.name
			   @order.shipping_code = @address.shipping_code
elsif params[:order_address] == "option3"
end


		@cart_items=current_customer.cart_items


    end

   def create
     @order = Order.new(order_params)
     @order.save
     current_customer.cart_items.each do |cart_item|
       @order_item = OrderItem.new
       @order_item.order_id = @order.id
       @order_item.item_id = cart_item.item_id
       @order_item.tax_price = cart_item.tax_price
       @order_item.quantity = cart_item.quantity
       @order_item.save!
     end
     current_customer.cart_items.destroy_all
     redirect_to orders_complete_path
   end

   def index
     @orders = current_customer.orders
   end
   def show
     @order = Order.find(params[:id])
     @order_items = @order.order_items
   end
   def complete
   end

   private

    def order_params
	    params.require(:order).permit(:customer_id, :method_of_payment, :total_amount, :shipping_code, :shipping_address, :post_name)
    end
end

