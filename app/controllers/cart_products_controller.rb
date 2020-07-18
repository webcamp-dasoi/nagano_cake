class CartProductsController < ApplicationController

def update
	@cart_product.update(quantity: params[:quantity].to_i)
    redirect_to ''
  end
end

end
