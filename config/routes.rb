Rails.application.routes.draw do
  root "pages#home"
  get "about", to: "pages#about"
  get "services", to: "pages#services"
  get "planes", to: "pages#planes"
  get "clientes", to: "pages#clientes"
  get "contacto", to: "pages#contacto"

  devise_for :users

  resource :dashboard, only: [:show], controller: 'dashboards'

  # Example resources for ad accounts and metrics if you later want CRUD
  resources :ad_accounts, only: [:index, :new, :create, :show]
  resources :ad_metrics, only: [:index]

end
