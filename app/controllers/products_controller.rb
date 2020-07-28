class ProductsController < ApplicationController

	before_action :login_check

		def index
			@products = Product.where(is_active: :true)
			@genres = Genre.where(is_active: :true)
			@genre_products = @products.where(genre_id: params[:genre])
		end

		def show
			@product = Product.find(params[:id])
			@genres = Genre.where(is_active: :true)
			@cart_product = CartProduct.new
			@cart_product.product_id = @product.id
			if end_user_signed_in?
				@cart_products = current_end_user.cart_products.find_by(product_id: params[:id])
			end
		end

		private

		def login_check
			if admin_signed_in?
				redirect_to owner_top_path
			end
		end

end
