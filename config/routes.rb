Rails.application.routes.draw do
  devise_for :users, :controllers => {:passwords => 'passwords'}
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
end
