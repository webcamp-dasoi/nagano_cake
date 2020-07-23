class CartProductsController < ApplicationController
	
	def index
		@cart_products = CartProduct.where(end_user: current_end_user)
		@cart_product = CartProduct.find_by(params[:id])
	end

	def create
		@product = Product.find(params[:cart_product][:product_id])
		@cart_product = CartProduct.new(cart_product_params)
		@cart_product.quantity = params[:cart_product][:quantity]
		@cart_product.product_id = @product.id
		@cart_product.end_user_id = current_end_user.id
		if @cart_product.save
			redirect_to cart_products_path
		else
			redirect_back(fallback_location: root_path)
		end
	end
  
  def update
		@cart_product = CartProduct.find(params[:id])
	  if	@cart_product.update(cart_product_params)
		  redirect_to cart_products_path
	  else
		  redirect_to cart_products_path
	  end
	end
  
	def destroy
		@cart_product = CartProduct.find(params[:id])
		@cart_product.destroy
		redirect_to products_path
	end

	def empty
		@cart_products = CartProduct.where(end_user: current_end_user)
		@cart_products.destroy_all
		redirect_to products_path
	end

	private

	def cart_product_params
		params.require(:cart_product).permit(:quantity)
	end
  
end
