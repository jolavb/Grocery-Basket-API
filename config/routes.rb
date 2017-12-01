# frozen_string_literal: true

Rails.application.routes.draw do
  resources :cart_items
  resources :items
  resources :stores
  resources :examples, except: %i[new edit]

  delete '/cart_items/' => 'cart_items#destroyall'
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out/:id' => 'users#signout'
  patch '/change-password/:id' => 'users#changepw'
  resources :users, only: %i[index show]

end
