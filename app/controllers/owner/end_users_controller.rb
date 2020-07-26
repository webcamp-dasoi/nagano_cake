class Owner::EndUsersController < ApplicationController

	before_action :authenticate_admin!

  def index
		@end_users = EndUser.all
	end

	def show
		@end_user = EndUser.find(params[:id])
	end

	def edit
		@end_user = EndUser.find(params[:id])
	end

	def update
		   @end_user = EndUser.find(params[:id])
		if @end_user.update(end_user_params)
           redirect_to edit_owner_end_user_path
        else
           render 'edit'
        end
	end

	private
  	def end_user_params
  		params.require(:end_user).permit(
  			:last_name, 
  			:first_name, 
  			:kana_last_name, 
  			:kana_first_nama, 
  			:post_number, 
  			:telephone_number, 
  			:email, 
				:is_active
			)
  	end
end
