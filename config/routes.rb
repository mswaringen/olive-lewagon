Rails.application.routes.draw do
  get 'profiles/show'
  get 'payments/new'
  get 'payments/create'
  get 'round_ups/new'
  get 'round_ups/create'
  get 'ngos/index'
  get 'ngos/show'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :ngos, only: [:index, :show]
  resources :round_ups, only: [:new, :create]
  resources :payments, only: [:new, :create]
  resources :profiles, only: [:show]

end
