Rails.application.routes.draw do

	root 'homes#top'
	get 'about' => 'homes#about'

	get 'end_users' => 'end_users#show'
	get 'end_users/quit' => 'end_users#quit'
	patch 'end_users/quit_update' => 'end_users#quit_update'
	get 'end_users/edit' => 'end_users#edit'
	patch 'end_users' => 'end_users#update'

	devise_for :end_users, controllers: {
		registrations: 'end_users/registrations',
		passwords: 'end_users/passwords',
		sessions: 'end_users/sessions'}

	devise_scope :admins do
		devise_for :admins, controllers: {
			registrations: 'admins/registrations',
			passwords: 'admins/passwords',
			sessions: 'admins/sessions'
		}
	end


	resources :addresses, only: [:index, :destroy, :create, :edit, :update]


	resources :products, only: [:index, :show]

	resources :cart_products, only: [:create, :index, :update, :destroy]
	delete 'cart_products' => 'cart_products#empty'

	get 'orders/finish' => 'orders#finish'
	resources :orders, only: [:new, :create, :index, :show]
	post '/orders/confirm' => 'orders#confirm'


	namespace :owner do

		resources :products, only: [:index, :new, :create, :show, :edit, :update]

		resources :genres, only: [:index, :create, :edit, :update]

		resources :end_users, only: [:index, :show, :edit, :update]

		resources :orders, only: [:index, :edit]
		patch '/orders/:id' => 'orders#order_update'

		patch 'order_products/:id' => 'order_products#producing_update', as: :producing
	end

end