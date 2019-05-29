Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :ngos, only: [:index, :show] do
    resources :portfolios, only: [:create]
  end
  resources :round_ups, only: [:new, :create]
  resources :payments, only: [:new, :create, :show]

  get "profile", to: "profiles#show"
  get "dashboard", to: "profiles#dashboard"
  get "sitemap", to: "pages#sitemap"
  get "link", to: "round_ups#link"
  post "get_access_token", to: "round_ups#get_access_token"
  get "link_result", to: "round_ups#link_result"

end
