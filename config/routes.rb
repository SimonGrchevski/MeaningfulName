Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'users#index'
  get 'comments/index'
  get 'show', to: 'users#show'
  get 'likes/index'
  resources :posts
  resources :comments
  post 'posts/:id/', to: 'posts#like', as: 'like'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show] do
    end
  end
  resources :likes
end
