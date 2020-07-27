class HomesController < ApplicationController

	def top
		@genres = Genre.where(is_active: :true)
		@products = Product.where(is_active: :true)
		@products_chose = @products.last(3)
	end

	def about
	end

end
