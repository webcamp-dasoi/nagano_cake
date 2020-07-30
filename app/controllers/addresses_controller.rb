class AddressesController < ApplicationController

  before_action :authenticate_end_user!
  
  def index
     @user = current_end_user
     @addresses = @user.addresses
     @address = Address.new
  end

  def create
      @address = Address.new(address_params)
      @address.end_user_id = current_end_user.id
    if @address.save
        flash[:notice] = "新しく住所を登録しました。"
        redirect_to addresses_path
    else
        @user = current_end_user
        @addresses = @user.addresses
        flash[:alert] = "エラーが発生しました。"
        render :index
    end
  end

  def destroy
      @address = Address.find(params[:id])
      @address.destroy
      flash[:notice] = "登録住所を削除しました。"
      redirect_to addresses_path
  end

  def edit 
    @addresses = Address.find(params[:id])
  end

  def update
    @addresses = Address.find(params[:id])
    if @addresses.update(address_params)
        #indexに偏移
        flash[:notice] = "更新しました。"
        redirect_to "/addresses"
    else
        flash[:alert] = "エラーが発生しました。"
        render :edit
    end
  end

  private

  def address_params
  	params.require(:address).permit(
    :name,
    :post_number,
    :address)
  end

end
