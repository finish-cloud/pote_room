Rails.application.routes.draw do
  devise_for :users
  root to:'rooms#index'

  get '/users/:id', to: 'users#show', as: 'user'
end
