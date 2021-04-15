Rails.application.routes.draw do

  devise_for :users
  root to:'rooms#top'

  get 'rooms/index'
  get "rooms/own_room" => "rooms#own_room"
  post "rooms/:id/reservations/recognize" => "reservations#recognize"
  get "rooms/:id/suggest" => "rooms#suggest"

  get "users/index" => "users#index"

  resources :users
  resources :rooms
  resources :reservations

  resources :rooms do
    resources :reservations
  end

  devise_scope :user do
    get 'account', to: 'users/registrations#account', as: 'account'
    patch 'profile_update', to: 'users/registrations#profile_update', as: 'profile_update'
  end
end
