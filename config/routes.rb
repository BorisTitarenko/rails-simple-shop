Rails.application.routes.draw do
  get 'instruments/index'
  get 'instruments/new'
  devise_for :users, controllers: {
    registrations: 'registrations'
  }
  root to: 'stores#index'
  resource :instruments
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
