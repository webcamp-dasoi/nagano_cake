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
			redirect_to new_owner_product_path
		else
			@genres = Genre.all
			render :new
		end
	end

	def edit
		@product = Product.find(params[:id])
		@genres = Genre.all
	end

	def update
		@product = Product.find(params[:id])
		@product.update(product_params)
		if @product.save
		   redirect_to owner_products_path
		else
		   @genres = Genre.all
		   render :edit
		end
	end

	private

	def product_params
		params.require(:product).permit(:name, :introduction, :non_tax_price, :image, :is_active, :genre_id)
	end

end
