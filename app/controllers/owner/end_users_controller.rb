class Owner::EndUsersController < ApplicationController

	before_action :authenticate_admin!

	def show
		@end_user = EndUser.find(params[:id])
	end
end
