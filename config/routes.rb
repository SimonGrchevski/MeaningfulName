Rails.application.routes.draw do
  devise_for :users, :controllers => {:passwords => 'passwords'}

  
  # get 'comments/index'
  # get 'show', to: 'users#show'
  # get 'likes/index'
  devise_scope :user do
    authenticated :user do
      root 'users#show', as: :authenticated_root
      resources :posts
      resources :comments
      resources :likes
    end
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
  # resources :posts
  # resources :comments
  # post 'posts/:id/', to: 'posts#like', as: 'like'
  # resources :users, only: [:index, :show] do
  #   resources :posts, only: [:index, :show] do
  #   end
  # end
  # resources :likes
end
