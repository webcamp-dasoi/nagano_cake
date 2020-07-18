class AddressesController < ApplicationController
def index
   @adresses = Adress.all
   @adress = Adress.new
end

def create
    @address = Adress.new(book_params)
    @adress.end_user_id = current_end_user.id
  if @address.save
      redirect_to @address
  	else
      @addresses = Adress.all
      render 'index'
   end
 end

 def destroy
 	address = Address.find(params[:id])
    address.destroy
    redirect_to addresses_path
 end
 end