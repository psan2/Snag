Rails.application.routes.draw do
  resources :mods
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#home"
  resources :beers
  resources :requests
  resources :users

  get '/open', to: 'requests#open'
  get '/snag', to: 'requests#snag'

  get '/sign_up', to: 'users#new', as: :sign_up


end
