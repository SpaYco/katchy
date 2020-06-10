Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :index, :show]
  resources :sessions, only: [:create]
  get '/signout' , to: 'sessions#signout'
  get '/signin' , to: 'sessions#new'
  resources :groups, only: [:new, :create, :index, :show]
  resources :recipes, only: [:new, :create, :index, :show]
  root 'users#index'
end
