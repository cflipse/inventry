Rails.application.routes.draw do
  resources :packages
  resources :foods
  resources :locations
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "foods#index"

  get "/inbox", to: "packages#new"
end
