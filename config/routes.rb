Rails.application.routes.draw do
  devise_for :users,
   controllers: { registrations: 'registrations' }
  root 'pages#home'

  get '/users/:id', to: 'users#show', as: 'user'


resources :posts, only: [:new, :create, :index] do
  resources :photos, only: [:create]
end
end
