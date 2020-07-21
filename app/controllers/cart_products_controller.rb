class CartProductsController < ApplicationController
	
	def index
		@cart_products = CartProduct.where(end_user: current_end_user)
	end

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
  
  def update
		@cart_prpduct = CartProduct.find(params[:id])
	  if	@cart_product.update(cart_product_params)
		  redirect_to cart_products_path
	  else
		  redirect_to cart_products_path
	  end
	end
  
	def destroy
		@cart_product = CartProducts.find(params[:id])
		@cart_product.destroy
		redirect_to cart_products_path
	end

	private

	def cart_product_params
		params.require(:cart_product).permit(:quantity)
	end
  
end
