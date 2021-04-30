Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :create, :show, :update, :destroy] do
    resources :artworks, only: [:index]
    resources :collections, only: [:index]
  end
  resources :artworks, only: [:create, :show, :update, :destroy] do
    member do
      get 'likes'
      post 'like'
      post 'unlike'
      post 'favorite'
      post 'unfavorite'
    end
  end

  resources :artwork_shares, only: [:create, :destroy] do 
    member do
      post 'favorite'
      post 'unfavorite'
    end
  end

  resources :comments, only: [:index, :create, :destroy] do
    member do
      get 'likes'
      post 'like'
      post 'unlike'
    end
  end

  resources :collections, only: [:create, :show, :destroy] do
    resources :artworks, only: [:index] do
      member do
        post :add, to: 'collections#add_artwork', as: 'add'
        post :remove, to: 'collections#remove_artwork', as: 'remove'
      end
    end
  end
end
