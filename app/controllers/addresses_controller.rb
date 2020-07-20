class AddressesController < ApplicationController
def index
   @user = current_user
   @addresses = @user.addresses
   @address = Address.new
end

def create
    @address = Address.new(address_params)
    @address.end_user_id = current_end_user.id
  if @address.save
     redirect_to addresses_path
  else
  	  @user = current_user
      render :index
  end
end

def destroy
 	@address = Address.find(params[:id])
    @address.destroy
    redirect_to addresses_path
end

end
