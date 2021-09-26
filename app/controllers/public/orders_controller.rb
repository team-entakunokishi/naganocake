class Public::OrdersController < ApplicationController
   before_action :authenticate_customer!

   def new
     @order = Order.new
		 @shipping_addresses = current_customer.addresses
   end
    def confilm
      @order = Order.new(order_params)
      @order.customer_id = current_customer.id
      @order.postage = 800

        #addresにaddresが入っていた場合
if params[:shipping_address] == "option1"
         @order.shipping_code = current_customer.post_code
         @order.shipping_address = current_customer.address
         @order.post_name = current_customer.last_name + current_customer.first_name
      #addresにshipping_addresが入っていた場合
elsif params[:shipping_address] == "option2"
			   @address = Address.find(params[:order][:select_address])
			   @order.shipping_address = @address.shipping_address
			   @order.name = @address.name
			   @order.shipping_code = @address.shipping_code
elsif params[:shipping_address] == "option3"
end


		@cart_items=current_customer.cart_items


    end

   def create
     @order = Order.new(order_params)
     @order.postage = 800
     @order.save
     current_customer.cart_items.each do |cart_item|
       @item_order = ItemOrder.new
       @item_order.order_id = @order.id
       @item_order.item_id = cart_item.item_id
       @item_order.tax_including_price = cart_item.tax_including_price
       @item_order.quantity = cart_item.quantity
       @item_order.save!
     end
     current_customer.cart_items.destroy_all
     redirect_to public_orders_complete_path
   end

   def index
     @orders = current_customer.orders
     @orders = Kaminari.paginate_array(@orders).page(params[:page]).per(8)
     @orders = current_customer.orders.page(params[:page]).reverse_order
   end
   def show
     @order = Order.find(params[:id])
     @item_orders = @order.item_orders
   end
   def complete
   end

   private

    def order_params
	    params.require(:order).permit(:customer_id, :method_of_payment, :total_amount, :shipping_code, :shipping_address, :post_name)
    end
end

