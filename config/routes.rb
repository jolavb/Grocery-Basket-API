# frozen_string_literal: true

Rails.application.routes.draw do
  resources :examples, except: %i[new edit]

  # Auth
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out/:id' => 'users#signout'
  patch '/change-password/:id' => 'users#changepw'
  resources :users, only: %i[index show]

  # cart_items
  resources :cart_items, except: %i[new edit]
  delete '/cart_items_clear/' => 'cart_items#destroyall'

  # Store items
  resources :items, only: %i[index show]

  # Stores
  resources :stores, only: %i[index show]

end
