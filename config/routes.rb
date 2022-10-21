Rails.application.routes.draw do
  get 'invoices/show'
  get 'invoices/index'
  get 'clients/show'
  get 'clients/index'
  devise_for :users
  root to: "pages#home"

  resources :users, only: [:show] 
  resources :clients
  resources :invoices

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
