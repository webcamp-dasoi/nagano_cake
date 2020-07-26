class ProductsController < ApplicationController

	before_action :login_check
	
		def index
			@products = Product.where(is_active: :true)
			@genres = Genre.where(is_active: :true)
			@genre_products = @products.where(genre_id: params[:genre])
		end

		def show
			@product = Product.find(params[:id])
			@cart_product = CartProduct.new
			@cart_product.product_id = @product.id
			@cart_products = CartProduct.find_by(product_id: params[:id])
		end

		private

		def login_check
			if admin_signed_in?
				redirect_to owner_top_path
			end
		end

end
