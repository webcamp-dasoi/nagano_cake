class Owner::OrderProductsController < ApplicationController
  
  before_action :authenticate_admin!

	def producing_update
		@order = Order.find(params[:id])
		@order_product = OrderProduct.find_by(id: params[:order_product][:id])
	    if @order_product.update(order_product_params)
	    	# 入力の値で分岐
		    case params[:order_product][:producing_status]
		    	# 製作ステータスが製作中の場合
			   when params[:order_product][:producing_status] = "製作中"
			   	    @order.update(order_status: "製作中")
			   	# 製作ステータスが製作完了の場合
			   when params[:order_product][:producing_status] = "製作完了"
			   		@order_products = OrderProduct.where(order_id: @order.id)
			        @statuses = OrderProduct.where(order_id: @order.id, producing_status: "製作完了")
			   		if @order_products.to_a.count == @statuses.to_a.count
				   	   @order.update(order_status: "発送準備中")
				    end
			end
			flash[:notice] = "更新しました。"
			redirect_to edit_owner_order_path(@order_product.order)
		else
			flash[:alert] = "エラーが発生しました。"
			render :edit
		end
	end

	private
  
	def order_product_params
    	params.require(:order_product).permit(:quantity, :tax_price, :producing_status)
    end
	
end
