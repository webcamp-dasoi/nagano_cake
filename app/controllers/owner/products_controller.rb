class Owner::ProductsController < ApplicationController

	before_action :authenticate_admin!

	def index
		# kaminariによる表記
		@products = Product.page(params[:page]).per(10)
	end

	def new
		@product = Product.new
		@genres = Genre.where(is_active: true)
	end

	def show
		@product = Product.find(params[:id])
	end

	def create
		@product = Product.new(product_params)
		if @product.save
			redirect_to owner_product_path(@product.id)
		else
			@genres = Genre.where(is_active: true)
			render :new
		end
	end

	def edit
		@product = Product.find(params[:id])
		@genres = Genre.where(is_active: true)
	end

	def update
		@product = Product.find(params[:id])
		if @product.update(product_params)
		   redirect_to owner_products_path
		else
		   @genres = Genre.where(is_active: true)
		   render :edit
		end
	end

	private

	def product_params
		params.require(:product).permit(:name, :introduction, :non_tax_price, :image, :is_active, :genre_id)
	end

end
