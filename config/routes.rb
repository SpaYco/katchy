Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :index, :show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :groups, only: [:new, :create, :index, :show]
  resources :recipes, only: [:new, :create, :index, :show]
end
