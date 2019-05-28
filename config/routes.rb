Rails.application.routes.draw do
  resources :mods
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#home"
  resources :beers, only: [:index]
  resources :requests
  resources :users, only: [:show, :new, :create, :edit, :update, :destroy]
  get '/sign_up', to: 'users#new', as: :sign_up

  resources :sessions, only: [:new, :create, :destroy]

  get '/log_in', to: 'sessions#new', as: :log_in
  delete '/log_out', to: 'sessions#destroy', as: :log_out

  get '/open', to: 'requests#open'
  get '/snag', to: 'requests#snag'

end
