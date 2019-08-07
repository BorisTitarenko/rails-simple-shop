Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'registrations',
    sessions: 'sessions'
  }
  root to: 'instruments#index'
  resources :instruments

  resources :sales, only: ['index', 'update', 'destroy'], path: "user/sales/"
  #get 'users/cart', to: 'order_items#index', as: :cart
  get 'user/cart/checkout', to: 'orders#checkout', as: :checkout

  patch 'user/cart/checkout', to: 'orders#create'

  get 'user/cart/history', to: 'orders#index', as: :history


  resources :order_items, path: "users/cart/"

end
