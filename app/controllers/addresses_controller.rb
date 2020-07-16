class AddressesController < ApplicationController

  def edit 
    @addresses = Addresses.find(params[:id])
  end

  def update
    @addresses = Addresses.find(params[:id])
    @addresses.save(addresses_params)
  end

  private

  def addresses_params
  	params.require(:address).permit(
    :name,
    :post_number,
    :address )
  end

end
