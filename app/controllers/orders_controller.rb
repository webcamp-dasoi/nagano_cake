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
    if params[:shipping] == '0'
      @order = Order.new(order_params)
      @order.end_user_id = current_end_user.id
      if @order.save
        current_end_user.cart_products.destroy
        redirect_to orders_finish_path
      else
        redirect_back(fallback_location: root_path)
      end
    elsif params[:shipping] == '1'
      
    elsif params[:shipping] == '2'
      @order = Order.new(order_params)
      @order.end_user_id = current_end_user.id
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
      :shipping_address,)
  end

end

# if params[:order][:shipping] == '0'
#   @order = params[:order][:shipping_name] == current_end_user.last_name, params[:order][:shipping_post_number] == current_end_user.shipping_post_number, params[:order][:shipping_address] == current_end_user.shipping_address
#   if @order.save
#     current_end_user.cart_products.destroy
#     redirect_to orders_finish_path
#   else
#     redirect_back(fallback_location: root_path)
#   end

# elsif params[:order][:shipping] == '1'
#   if @order.save
#     current_end_user.cart_products.destroy
#     redirect_to orders_finish_path
#   else
#     redirect_back(fallback_location: root_path)
#   end

# elsif params[:order][:shipping] == '2'
#   @order = Order.new(order_params)
#   @order.end_user_id = current_end_user.id
#   if @order.save
#     current_end_user.cart_products.destroy
#     redirect_to orders_finish_path
#   else
#     redirect_back(fallback_location: root_path)
#   end

# end
