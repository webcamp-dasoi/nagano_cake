class Owner::ProductsController < ApplicationController

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

	def edit
		@product = Product.find(params[:id])
		@genres = Genre.all
	end

	def update
		@product = Product.find(params[:id])
		@product.update(product_params)
		if @product.save
		   redirect_to @product
		else
		   @genres = Genre.all
		   render :edit
		end
	end

	private

	def product_params
		params.require(:product).permit(:name, :introduction, :non_tax_price, :image_id, :is_active, :genre_id)
	end

end
