Rails.application.routes.draw do
  root   'static_pages#home'
  get    '/help',    to: 'static_pages#help'
  get    '/about',   to: 'static_pages#about'
  get    '/contact', to: 'static_pages#contact'
  resources :authors, only: [:show]
  resources :books, only: [:index, :show]
  resources :categories, only: [:show]
  resources :carts, only: [:show]
  resources :cart_items, only: [:create, :update, :destroy]
  devise_for :users
end
