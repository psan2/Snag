Rails.application.routes.draw do
  resources :mods
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#home"
  resources :beers
  resources :requests
  resources :users

  get '/requests/open', to: 'requests#open'

end
