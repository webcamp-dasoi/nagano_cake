class AddressesController < ApplicationController

  def edit 
    @addresses = Address.find(params[:id])
  end

  def update
    @addresses = Address.find(params[:id])
    @addresses.update(address_params)
    #indexに偏移
    redirect_to "/addresses"
  end

  private

  def address_params
  	params.require(:address).permit(
    :name,
    :post_number,
    :address)
  end

end
