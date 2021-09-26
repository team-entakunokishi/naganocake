class Admins::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    if @order.order_status == "入金確認"
      @order.item_orders.each do |item_order|
        item_order.update(product_status: "製作待ち")
      end
    end
    redirect_to admins_order_path(@order)
  end

  private

  def order_params
    params.require(:order).permit(:order_status)
  end
end
