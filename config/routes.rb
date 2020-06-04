Rails.application.routes.draw do
  resources :carts, path: "mon_panier"
  resources :join_cart_items
  devise_for :users, path: "profil"
  resources :users, only: :show, path: "profil"
  root to: "items#index"
  resources :items, path: "chaton"
  resources :orders
  resources :charges, path: "paiement"
end
