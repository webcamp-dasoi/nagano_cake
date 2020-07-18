class AddressesController < ApplicationController
def index
   @adresses = Address.find(params[:id])
   @adress = Address.new
end

def create
    @address = Address.new(address_params)
    @address.end_user_id = current_end_user.id
  if @address.save
     redirect_to @address
  else
      @addresses = Address.find(params[:id])
      render 'index'
  end
end

def destroy
 	@address = Address.find(params[:id])
    address.destroy
    redirect_to addresses_path
end

end