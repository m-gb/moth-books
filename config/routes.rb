Rails.application.routes.draw do
  root   'static_pages#home'
  get    '/help',           to: 'static_pages#help'
  get    '/about',          to: 'static_pages#about'
  get    '/contact',        to: 'static_pages#contact'
  get    '/order_complete', to: 'orders#complete'
  patch  '/orders/new',      to: 'orders#create'
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  resources :authors,    only: [:show]
  resources :books,      only: [:index, :show]
  resources :categories, only: [:show]
  resources :carts,      only: [:show]
  resources :cart_items, only: [:create, :update, :destroy], defaults: { format: 'js' }
  authenticate :user do
    resources :orders,   only: [:new, :create, :index, :show]
  end
end
