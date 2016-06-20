Rails.application.routes.draw do

  resource :cart, only: [:show]
  devise_scope :user do
    get '/login' => 'devise/sessions#new'
    get '/signup' => 'devise/registrations#new', as: 'user_signup'
	end

	devise_for :users, path_names: {sign_up: 'signup', sign_out: 'logout', sign_in: 'login'}

	resources :products, only: [:index, :show]

  match '/orders/(:id)' => 'orders#create', via: :post, as: :new_order
  resources :orders, only: [:create, :update, :destroy]

  root to: 'store#index'

end
