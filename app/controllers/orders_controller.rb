class OrdersController < ApplicationController

  before_action :authenticate_end_user!

  def index
    @orders = Order.where(end_user_id: current_end_user.id)
  end

  def new
    @order = Order.new
    @addresses = current_end_user.addresses
  end

  def show
  	@order = Order.find(params[:id])
  end

  def confirm
    @order = Order.new
    @order.order_products.new
    @end_user = current_end_user
    @shipping_cost = 800
    @address = Address.find_by(id: params[:order][:addresses])
  end

  def create
    @order = Order.new(order_params)
    @order.end_user_id = current_end_user.id
    if @order.save
      @cart_products = CartProduct.where(end_user: current_end_user)
      @cart_products.destroy_all
      redirect_to orders_finish_path
    else
      redirect_back(fallback_location: '/orders/confirm')
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
      :total_price,
      order_products_attributes: [:quantity, :tax_price, :product_id]
    )
  end

end

