class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  	def after_sign_in_path_for(resource)
		case resource
		when Admin
				owner_top_path
		when EndUser
		    root_path
		end
	end

	def after_sign_out_path_for(resource)
		if resource == EndUser
			root_path
		else resource == Admin
		    root_path
		end
	end

	def configure_permitted_parameters
	    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :kana_first_name, :kana_last_name, :email, :post_number, :address, :telephone_number])
	    devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
	end

end
