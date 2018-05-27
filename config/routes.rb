Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :articles, only: [:index, :new, :create, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
  root 'articles#index'
end
