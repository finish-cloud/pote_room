Rails.application.routes.draw do

  devise_for :users
  root to:'rooms#top'

  get 'rooms/index'
  get "rooms/own_room" => "rooms#own_room"
  post "rooms/:id/reservations/recognize" => "reservations#recognize"
  get "rooms/:id/suggest" => "rooms#suggest"


  resources :users, only: [:show, :update]
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
