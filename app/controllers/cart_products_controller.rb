class CartProductsController < ApplicationController

	before_action :authenticate_end_user!
	
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
			flash[:alert] = "数量を選択してください。"
			redirect_back(fallback_location: root_path)
		end
	end
  
  def update
		@cart_product = CartProduct.find(params[:id])
		if	@cart_product.update(cart_product_params)
			flash[:notice] = "数量を変更しました！"
		  redirect_to cart_products_path
		else
			flash[:alert] = "エラーが発生しました。"
		  redirect_to cart_products_path
	  end
	end
  
	def destroy
		@cart_product = CartProduct.find(params[:id])
		@cart_product.destroy
		flash[:notice] = "商品を1つを削除しました！"
		redirect_to cart_products_path
	end

	def empty
		@cart_products = CartProduct.where(end_user: current_end_user)
		@cart_products.destroy_all
		flash[:notice] = "カートの商品を全て削除しました！"
		redirect_to cart_products_path
	end

	private

	def cart_product_params
		params.require(:cart_product).permit(:quantity)
	end
  
end
