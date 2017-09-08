Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'posts/new' => 'posts#new'
  post 'posts' => 'posts#create'
  get 'posts' => 'posts#home'
  get 'profile' => 'profiles#show'
  get 'profile/new' => 'profiles#new'
  post 'profile' => 'profiles#create'

  resources :users
  resources :posts, only: [:show]
  resources :profiles, only: [:show]
end
