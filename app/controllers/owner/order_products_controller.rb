class Owner::OrderProductsController < ApplicationController

	def producing_update
		@order_product = OrderProduct.find(params[:id])
		if @order_product.update(order_product_params)
		   redirect_to edit_owner_order_path(@order_product.order)
		else
			render :edit
		end
	end

	def order_product_params
    	params.require(:order_product).permit(:quantity, :tax_price, :producing_status)
    end
end
