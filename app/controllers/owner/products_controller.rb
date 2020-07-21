class Owner::ProductsController < ApplicationController

	def new
		@product = Product.new
		@genres = Genre.all
	end

end
