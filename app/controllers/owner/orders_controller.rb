class Owner::OrdersController < ApplicationController
	def index
		@orders = Order.page(params[:page]).reverse_order
	end
end
