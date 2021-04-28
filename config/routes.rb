Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :create, :show, :update, :destroy] do
    resources :artworks, only: [:index]
  end
  resources :artworks, only: [:create, :show, :update, :destroy] do
    member do
      get 'likes'
      post 'like'
      post 'unlike'
    end
  end
  resources :artwork_shares, only: [:create, :destroy]
  resources :comments, only: [:index, :create, :destroy] do
    member do
      get 'likes'
      post 'like'
      post 'unlike'
    end
  end
end
