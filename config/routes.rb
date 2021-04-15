Rails.application.routes.draw do

  devise_for :users
  root to:'rooms#top'

  get 'rooms/index'
  get "users/index" => "users#index"
  get "rooms/own_room" => "rooms#own_room"
  post "rooms/:id/reservations/recognize" => "reservations#recognize"

  get '/users/:id' => 'users#show'

  resources :users
  resources :rooms
  resources :reservations

  resources :rooms do
    resources :reservations
  end

  devise_scope :user do
    get 'account', to: 'users/registrations#account', as: 'account'
    patch 'update', to: 'users/registrations#update', as: 'update'
  end
end
