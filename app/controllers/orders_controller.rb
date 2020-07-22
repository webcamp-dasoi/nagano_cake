class OrdersController < ApplicationController

  def new
    @order = Order.new
    @addresses = current_end_user.addresses
  end

  def show
  	@order = Order.find(params[:id])
  end

  def confirm
    @order = Order.new(order_params)
    @end_user = current_end_user
    @cart_product = CartProduct.where(end_user_id: current_end_user.id)
  end

  def finish
  end

  def index
    @orders = Order.where(end_user_id: current_end_user.id)
  end


  private

  def order_params
  	params.require(:order).permit(
      :payment_method,
      :shipping_name,
      :shipping_post_number,
      :shipping_address,)
  end

end
