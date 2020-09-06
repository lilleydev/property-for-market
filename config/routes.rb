Rails.application.routes.draw do
  resources :comments
  resources :realtors
  resources :tasks
  resources :rooms
  root 'rooms#index'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
