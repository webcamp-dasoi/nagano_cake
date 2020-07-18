class AddressesController < ApplicationController
	def create
		@address = Address.new(address_params)
		@address.end_user_id = current_user.id
		@address.save
		redirect_to addresses_path

	private
	def address_params
		params.require(:address).permit(:name, :post_number, :address)
end
