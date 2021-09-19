class Public::OrdesController < ApplicationController
   before_action :authenticate_customer!

   def new
     @order = Order.new
		 @addresses = current_customer.addresses
   end
   def confilm
     @order = Order.new(order_params)
     @order.customer_id = current_customer.id
     


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
