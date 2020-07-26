class ProductsController < ApplicationController


  def index
		@products = Product.all
		@genres = Genre.where(is_active: :true)
		@genre_products = Product.where(genre_id: params[:genre])
	end

	def show
		@product = Product.find(params[:id])
		@cart_product = CartProduct.new
		@cart_product.product_id = @product.id
	end


end
