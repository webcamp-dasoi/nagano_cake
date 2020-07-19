class CartProductsController < ApplicationController

	def create
		@product = Product.find(params[:product_id])
		@cart_product = CartProduct.new(cart_product_params)
		@cart_product.quantity = params[:quantity]
		@cart_product.product_id = @product.id
		@cart_product.user_id = current_user.id
		if @cart_product.save
			redirect_to :index
		else
			redirect_back(fallback_location: root_path)
		end
	end

	private

	def cart_product_params
		params.require(:cart_product).permit(:quantity)
	end
end
