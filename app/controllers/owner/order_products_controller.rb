class Owner::OrderProductsController < ApplicationController
  
  before_action :authenticate_admin!

	def producing_update
		@order = Order.find(params[:id])
		@order_product = OrderProduct.find_by(id: params[:order_product][:id])
		if @order_product.update(order_product_params)
		   @order_products = OrderProduct.where(order_id: @order.id, producing_status: "製作完了")
			if @order_products.to_a.count == OrderProduct.where(order_id: @order.id).to_a.count
			   @order.update(order_status: "発送準備中")
		   	end
		   redirect_to edit_owner_order_path(@order_product.order)
		else
			render :edit
		end
	end

	private
  
	def order_product_params
    	params.require(:order_product).permit(:quantity, :tax_price, :producing_status)
    end
	before_action :authenticate_admin!
	
end
