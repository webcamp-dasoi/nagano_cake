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
    @total_money = @end_user.cart_products.to_a.sum { |cart_product| cart_product.subtotal_calculation}.floor.to_s(:delimited)
    @total_price = @end_user.cart_products.to_a.sum { |cart_product| cart_product.subtotal_calculation}.floor
    @amount_billed = ( @end_user.cart_products.to_a.sum { |cart_product| cart_product.subtotal_calculation} + @shipping_cost ).floor.to_s(:delimited)
    @address = Address.find_by(id: params[:order][:addresses])
    @address_new = Address.new
  end

  def create
    @order = Order.new(order_params)
    @order.end_user_id = current_end_user.id
    if @order.save
      if params[:order][:shipping] == '2'
        @address = Address.new(address_params)
        @address.end_user_id = current_end_user.id
        @address.save
      end
      @cart_products = CartProduct.where(end_user: current_end_user)
      @cart_products.destroy_all
      redirect_to orders_finish_path
    else
      flash[:alert]
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

  def address_params
  	params.require(:address).permit(
        :name,
        :post_number,
        :address
    )
  end

end

