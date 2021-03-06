Rails.application.routes.draw do
  resources :collections
  get 'artists/index'
  get 'artists/show'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '*path', to: 'home#index', constraints: ->(request){ request.format.html? }
  root to: 'home#index'
  get '/artists', to: 'artists#index'
  get '/artists/:id', to:'artists#show', as: 'artist'

end
