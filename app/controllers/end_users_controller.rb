class EndUsersController < ApplicationController
  def show
    @end_user = current_user
  end


end
