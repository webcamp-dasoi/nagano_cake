class Owner::OrdersController < ApplicationController
  
  before_action :authenticate_admin!
  
  def index
		@orders = Order.page(params[:page]).reverse_order
	end

	def edit
		@order = Order.find(params[:id])
		@order_products = OrderProduct.where(order_id: @order.id)
	end
 
	def order_update
		@order = Order.find(params[:id])
		if @order.update(order_params)
			if params[:order][:order_status] == "入金確認"
			   @order_products = OrderProduct.where(order_id: @order.id)
			   @order_products.update(producing_status: "製作待ち")
		   	end
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
