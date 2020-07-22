class Owner::ProductsController < ApplicationController

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

	private

	def product_params
		params.require(:product).permit(:name, :introduction, :non_tax_price, :image, :is_active, :genre_id)
	end

end
