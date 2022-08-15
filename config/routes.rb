Rails.application.routes.draw do
  resources :petitions
  resources :plates
  get '/home', to: 'home#index'
  # Defines the root path route ("/")
  root "home#index"
  get 'home/:position', to: "home#show", as: :show
  get 'home/1/:position/:plate_id', to: "home#update_state_order", as: :update_state_order
  get 'home/0/:position', to: "home#update_state_finalize", as: :update_state_finalize
end
