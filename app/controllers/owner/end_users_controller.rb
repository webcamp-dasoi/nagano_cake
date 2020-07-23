class Owner::EndUsersController < ApplicationController

	def index
		@end_user = EndUser.all
	def show
		@end_user = EndUser.find(params[:id])
	end
end
