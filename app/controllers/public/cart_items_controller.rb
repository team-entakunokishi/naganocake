class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  before_action :setup_cart_item!, only: [:update, :create, :destroy, :empty]
  def index
    @cart_items=current_customer.cart_items
  end
    def create
    cart_item = current_customer.cart_items.find_by(item_id: params[:item_id])
		if cart_item.present?
			cart_item.update(quantity: cart_item.quantity + params[:quantity].to_i)
			flash[:notice] = "数量変更しました"
		else
			new_cart_item=CartItem.new(cart_item_params)
			new_cart_item.save
			flash[:notice] = "商品をカートにいれました"
		end

    redirect_to public_cart_items_path

    end
  def update
    cart_item=CartItem.find(params[:id])
		cart_item.update(cart_item_params)
		flash[:notice] = "数を変更しました"
		redirect_back(fallback_location: root_path)
  end
  def destroy
    cart_item=CartItem.find(params[:id])
		cart_item.destroy
		flash[:notice] = "1個削除しました"
		redirect_back(fallback_location: root_path)
  end
  def empty
    CartItem.destroy_all
    redirect_to public_items_path
  end


  private
   def setup_cart_item!
	   @cart_item=CartItem.find_by(item_id: params[:item_id])
   end

   def cart_item_params
	   params.require(:cart_item).permit(:quantity, :customer_id, :item_id)
   end


end
