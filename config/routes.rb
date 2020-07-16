Rails.application.routes.draw do
  devise_for :admins

  devise_for :end_users, controllers: {
  	registrations: 'end_users/registrations',
    passwords: 'end_users/passwords',
    sessions: 'end_users/sessions'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
