Rails.application.routes.draw do
  resources :line_items
  resources :carts
  resources :join_cart_items
  devise_for :users
  root "items#index"
  resources :items
end
