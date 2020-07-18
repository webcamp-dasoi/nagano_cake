class CartProductsController < ApplicationController
def update
	@cart_prpduct = CartProduct.find(params[:id])
    if @cart_product.update(cart_product_params)
       redirect_to ''
    else
       render ''
    end
end
end
