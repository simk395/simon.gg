Rails.application.routes.draw do
  resources :summoners
  resources :games, only: [:show]
  post "/games", to: "games#create", as: 'games' 
  resources :match_histories
  get "/", to: "summoners#new", as: "homepage"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
