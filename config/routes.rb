Rails.application.routes.draw do
  resources :mods
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :beers 
  resources :users 
  resources :requests
end
