class AddressesController < ApplicationController

def index
    @addresses = Address.find(params[:id])
   	@address = Address.new
end

def new
  	@address = Address.new
end

def create
  	@address = Address.new(address_params)
    @address.end_user_id = current_end_user.id
    if @address.save
       redirect_to @address
    else
       render 'index'
    end
end

private

def address_params
    params.require(:address).permit(:post_number, :address, :name)
end

end
