class OrdersController < ApplicationController

  def new
    @order = Order.new
    @addresses = current_end_user.addresses
  end

  def show
  	@oder = Order.find(params[:id])
  end

  def confirm
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
