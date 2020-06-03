Rails.application.routes.draw do
  resources :carts
  resources :join_cart_items
  devise_for :users
  root to: "items#index"
  resources :items
  resources :orders
  resources :charges
end
