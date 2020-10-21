Rails.application.routes.draw do
  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout' },
                     controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :users, only: %i[show index]

  root 'rooms#index'

  patch '/user_tasks/:id', to: 'user_tasks#update', as: 'user_task'

  resources :rooms do
    resources :tasks, shallow: true do
      post '/user_tasks', to: 'user_tasks#create', as: 'volunteer'
      get '/user_tasks', to: 'user_tasks#new', as: 'help'
      delete '/user_tasks', to: 'user_tasks#destroy', as: 'cancel'
    end
  end

  get '/users/:id/tasks', to: 'tasks#index', as: 'users_tasks'
  get '/needs_help', to: 'needs_help#index'
end
