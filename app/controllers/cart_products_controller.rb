class CartProductsController < ApplicationController
def update
	@cart_prpduct = CartProduct.find(params[:id])
    if @cart_product.update(cart_product_params)
       redirect_to cart_products_path
    else
       redirect_to @cart_prpduct
    end
end
end
