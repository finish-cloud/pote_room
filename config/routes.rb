Rails.application.routes.draw do

  devise_for :users
  root to:'rooms#top'

  get 'rooms/index'
  get "users/index" => "users#index"

  resources :users
  resources :rooms
end
