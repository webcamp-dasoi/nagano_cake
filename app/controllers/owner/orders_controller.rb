class Owner::OrdersController < ApplicationController

	def edit
		@order = Order.find(params[:id])
		@order_product = OrderProduct.where(order_id: @order.id)
		@end_user = @order.end_user
	end
end
