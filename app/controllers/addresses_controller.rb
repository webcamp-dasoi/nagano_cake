class AddressesController < ApplicationController
	
  def index
    @addresses = Address.all
   	 @address = Address.new
  end

  def new
  	 @address = Address.new
  end

  def create
  	 @address = Address.new(book_params)
    @address.end_user_id = current_end_user.id
    if @address.save
      redirect_to @book
    else
      @books = Book.all
      render 'index'
    end
  end

  private

  def list_params
    params.require(:list).permit(:post_number, :address,:name)
  end

end
