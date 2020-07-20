class AddressesController < ApplicationController

def destroy
 	@address = Address.find(params[:id])
    @address.destroy
    redirect_to addresses_path
end

end
