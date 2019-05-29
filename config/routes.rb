Rails.application.routes.draw do
  resources :locations
  resources :mods
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#home"

  resources :beers, only: [:index]
  resources :requests
  resources :users, only: [:show, :new, :create, :edit, :update, :destroy]
  resources :sessions, only: [:new, :create, :destroy]

  get '/sign_up', to: 'users#new', as: :sign_up

  get '/log_in', to: 'sessions#new', as: :log_in
  get '/log_out', to: 'sessions#destroy', as: :log_out

  get '/open', to: 'requests#open'
  post '/snag', to: 'requests#snag'
  get '/confirm', to: 'requests#confirm'

end
