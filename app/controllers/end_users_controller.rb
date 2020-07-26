class EndUsersController < ApplicationController

  before_action :authenticate_end_user!

  def show
    @end_user = current_end_user
  end

  def edit
    @end_user = current_end_user
  end

  def update
    @end_user = current_end_user
    @end_user.update(end_user_params)
    redirect_to end_users_path
  end

  def quit
    @end_user = current_end_user
  end

  def quit_update
    @end_user = current_end_user
    if @end_user.update(is_active: "Invalid")
      # ログアウトさせる記述
      reset_session
      redirect_to root_path
    else
      redirect_to about_path
    end
  end

 private

  def end_user_params
    params.require(:end_user).permit(
      :last_name,
      :first_name,
      :kana_last_name,
      :kana_first_name,
      :post_number,
      :address,
      :telephone_number,
      :email,
      :password )
  end

end

