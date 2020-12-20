Rails.application.routes.draw do
  get 'artists/index'
  get 'artists/show'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'home#index'
  get '/artists', to: 'artists#index'
  get '/artists/:id', to:'artists#show', as: 'artist'
  get '/collection', to: 'collection#index'

end
