Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  # get '/users', to: 'user#index', as: 'users'
  # post '/users', to: 'user#create'
  # get '/users/new', to: 'user#new', as: 'new_user'
  # get '/users/:id/edit', to: 'user#edit', as: 'edit_user'
  # get '/users/:id', to: 'user#show', as: 'user'
  # patch '/users/:id', to: 'user#update'
  # put '/users/:id', to: 'user#update'
  # delete '/users/:id', to: 'user#destroy'
end
