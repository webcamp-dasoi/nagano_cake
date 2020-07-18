class AddressesController < ApplicationController
	def create
		@address = Address.new(address_params)
		@address.end_user_id = current_user.id
		if @address.save
			redirect_to @address
		else
			@addresses = Address.all
			render 'index'

	private
	def address_params
		params.require(:address).permit(:name, :post_number, :address)
end
