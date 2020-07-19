class CartProductsController < ApplicationController

def destroy
	@cart_product = CartProducts.find(params[:id])
    @cart_product.destroy
    redirect_to cart_products_path
end
