Rails.application.routes.draw do

  devise_for :users
  root to:'rooms#top'

  get 'rooms/index'
  get "users/index" => "users#index"
  get "rooms/own_room" => "rooms#own_room"

  resources :users
  resources :rooms
  resources :reservations

  resources :rooms do
    resources :reservations
  end
end
