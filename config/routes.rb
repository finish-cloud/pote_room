Rails.application.routes.draw do
  get 'room/index'
  get 'room/new'
  get 'room/create'
  get 'room/listiong'
  get 'room/pricing'
  get 'room/description'
  get 'room/photo_upload'
  get 'room/location'
  get 'room/update'
  devise_for :users
  root to:'rooms#index'

  get '/users/:id', to: 'users#show', as: 'user'
end
