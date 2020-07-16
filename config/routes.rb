Rails.application.routes.draw do

	root 'homes#top'
	get 'about' => 'homes#about'

	devise_scope :admins do
		devise_for :admins, controllers: {
			registrations: 'admins/registrations',
			passwords: 'admins/passwords',
			sessions: 'admins/sessions'
		}
	end
  
  devise_for :end_users, controllers: {
  	registrations: 'end_users/registrations',
    passwords: 'end_users/passwords',
    sessions: 'end_users/sessions'}

  devise_for :end_users

end
