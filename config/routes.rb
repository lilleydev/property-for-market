Rails.application.routes.draw do
  resources :comments
  resources :realtors
  resources :users, only: [:show]
  root 'rooms#index'
  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout' },
                     controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :rooms do
    resources :tasks, except: %i[show index]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
