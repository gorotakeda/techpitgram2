Rails.application.routes.draw do
  devise_for :users,
    controllers: { registrations: 'registrations' }
    get '/users/:id', to: 'users#show', as: 'user'

  root 'posts#index'
 resources :posts, only: [:new, :create, :index, :show, :destroy] do
   resources :photos, only: [:create]
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
end
