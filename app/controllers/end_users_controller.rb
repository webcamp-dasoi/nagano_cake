class EndUsersController < ApplicationController

  def edit
    @end_user = current_user
  end

  def updete
    @end_user = current_user
    @end_user.update(end_user_params)
  end

 private 

  def end_user_params
    params.require(:end_user).permit(
    :last_name,
    :first_name
    :kana_last_name,
    :kana_first_name,
    :post_number,
    :address,
    :telephone_number,
    :email,
    :password )
  end
  

end
