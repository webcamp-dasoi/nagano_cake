class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?


	protected
	  def after_sign_in_path_for(resource)
		  case resource
		  when Admin
		    admins_home_path
		  when EndUser
		    end_users_path
		  end
	    end

	  def configure_permitted_parameters
	    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :kana_first_name, :kana_last_name, :email, :post_number, :address, :telephone_number])
	  end
end