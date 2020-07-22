class ProductsController < ApplicationController


  def index
    @products = Product.all
  end

	def show
		@product = Product.find(params[:id])
		@cart_product = CartProduct.new
		@cart_product.product_id = @product.id
	end


end
