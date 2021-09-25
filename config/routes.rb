Rails.application.routes.draw do
  devise_for :users,
   controllers: { registrations: 'registrations' }
  root 'posts#index'

  get '/users/:id', to: 'users#show', as: 'user'


resources :posts, only: [:new, :create, :index, :show, :destroy] do
  resources :photos, only: [:create]
end
end
