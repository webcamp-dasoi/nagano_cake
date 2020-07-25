class Owner::EndUsersController < ApplicationController

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
  		params.require(:user).permit(
  			:last_name, 
  			:first_name, 
  			:last_name_kana, 
  			:first_name_kana, 
  			:postal_number, 
  			:telephone_number, 
  			:email, 
  			:is_active)
  	end
end
