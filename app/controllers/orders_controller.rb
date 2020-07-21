class OrdersController < ApplicationController

  def new
    @order = Order.new
    @addresses = current_end_user.addresses
  end

  def confirm
    @order = Order.new(order_params)
    @end_user = current_end_user
  end

  def create
    @order = Order.new(order_params)
    @order.end_user_id = current_end_user.id
    @shipping_cost = 800
    @total_price = current_end_user.products.non_tax_price * current_end_user.products.cart_product.quantity * 1.1
    if params[:shipping] == '0'
      if @order.save
        current_end_user.cart_products.destroy
        redirect_to orders_finish_path
      else
        redirect_back(fallback_location: root_path)
      end
    elsif params[:shipping] == '1'
      
    elsif params[:shipping] == '2'
      if @order.save
        current_end_user.cart_products.destroy
        redirect_to orders_finish_path
      else
        redirect_back(fallback_location: root_path)
      end
    end
  end

  def finish
  end


  private

  def order_params
  	params.require(:order).permit(
      :payment_method,
      :shipping_name,
      :shipping_post_number,
      :shipping_address,
      :shipping_cost,
      :total_price)
  end

end

