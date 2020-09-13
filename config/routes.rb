Rails.application.routes.draw do
  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout' },
                     controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # devise_for :users, path_prefix: 'd'
  resources :users, only: [:show]

  # match 'users/:id', to: 'users#show', via: 'get'
  root 'rooms#index'

  resources :rooms do
    resources :tasks, except: %i[show], shallow: true do
      post '/user_tasks', to: 'user_tasks#create', as: 'volunteer'
    end
  end

  resources :tasks, only: [:index]
  get '/needs_help', to: 'needs_help#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
