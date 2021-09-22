class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def after_sign_in_path_for(resource)
    case resource
    when Customer
      root_path
    when Admin
      admins_orders_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys:[:email,:encrypted_password])
  end

   helper_method :current_cart
   def current_cart
  	current_cart = current_customer.cart_items
  	current_cart = CartItem.find_by(id: session[:cart_id]) || CartItem.create  # セッションから取得したcart_idを元にCartテーブルからCart情報を取得
  	session[:cart_id] ||= current_cart.id # 取得したCart情報よりIDを取得し、セッションに設定
   end


end
