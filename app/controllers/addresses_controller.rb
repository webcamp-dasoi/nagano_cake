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
  
  def destroy
 	  @address = Address.find(params[:id])
    @address.destroy
    redirect_to addresses_path
end

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
