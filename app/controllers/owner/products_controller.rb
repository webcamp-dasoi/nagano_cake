class Owner::ProductsController < ApplicationController

	def index
		# kaminariによる表記
		@products = Product.page(params[:page]).per(10)
	end

	def new
		@product = Product.new
		@genres = Genre.all
	end

	def create
		@product = Product.new(product_params)
		if @product.save
			redirect_to :show
		else
			@genres = Genre.all
			render :new
		end
	end

	private

	def product_params
		params.require(:product).permit(:name, :introduction, :non_tax_price, :image_id, :is_active, :genre_id)
	end

end
