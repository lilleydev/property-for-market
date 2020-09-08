Rails.application.routes.draw do
  resources :comments
  resources :realtors

  root 'rooms#index'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :rooms do
    resources :tasks, shallow: true, except: %i[show index]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
