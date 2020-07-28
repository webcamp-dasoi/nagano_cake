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
    if @end_user.update(end_user_params)
      flash[:notice] = "お客様情報を更新しました！"
      redirect_to end_users_path
    else
      flash[:alert] = "エラーが発生しました。"
      render :edit
    end
  end

  def quit
    @end_user = current_end_user
  end

  def quit_update
    @end_user = current_end_user
    if @end_user.update(is_active: false)
      # ログアウトさせる記述
      reset_session
      redirect_to root_path
    else
      flash[:alert] = "エラーが発生しました。"
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

