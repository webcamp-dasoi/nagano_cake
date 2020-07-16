Rails.application.routes.draw do

	root 'homes#top'
	get 'about' => 'home#about'

	devise_scope :admins do
		devise_for :admins, controllers: {
			registrations: 'admins/registrations',
			passwords: 'admins/passwords',
			sessions: 'admins/sessions'
		}
	end

  devise_for :end_users
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	
end
