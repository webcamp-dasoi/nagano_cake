class AddressesController < ApplicationController
	def create
		@address = Address.new(address_params)
		@address.end_user_id = current_end_user.id
		if @address.save
			redirect_to @address
		else
			@addresses = Address.all
			render 'index'
		end
	end
end
