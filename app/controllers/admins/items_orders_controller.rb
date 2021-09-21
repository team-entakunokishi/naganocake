class Admins::ItemsOrdersController < ApplicationController
  before_action :authenticate_admin!
  def show
    @order = Order.find(params[:id])
  end
  
  def update
    @item_order = ItemsOrder.find(params[:id])
    @item_order.update(item_order_params)
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def item_order_params
    params.require(:item_order).permit(product_status)
  end
  
end