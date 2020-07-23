class Owner::OrdersController < ApplicationController

	def edit
		@order = Order.find(params[:id])
		@order_product = OrderProduct.find(params[:id])
		@order_products = OrderProduct.where(order_id: @order.id)
		@end_user = @order.end_user
	end

	def order_update
		@order = Order.find(params[:id])
		if @order.update(order_params)
		   redirect_to edit_owner_order_path(@order)
		else
			render :edit
		end
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
      :order_status,
      order_products_attributes: [:quantity, :tax_price, :producing_status, :product_id]
    )
    end

end
