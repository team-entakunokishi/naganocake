class Admins::ItemsOrdersController < ApplicationController
  before_action :authenticate_admin!
  def show
    @order = Order.find(params[:id])
  end
  
  def update
    @item_order = ItemOrder.find(params[:id])
    @item_orders = @item_order.order.item_orders
    @order = @item_order.order
    @item_order.update(item_order_params)
    if @item_order.product_status == "製作中"
       @item_order.order.update(order_status: "製作中")
    elsif @item_orders.count == @item_orders.where(product_status: "製作完了").count
          @item_order.order.update(order_status: "発送準備中")
    end
    redirect_to admins_order_path(@order)
  end
  
  private
  
  def item_order_params
    params.require(:item_order).permit(:product_status)
  end
  
end