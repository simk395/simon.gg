Rails.application.routes.draw do
  resources :summoners
  resources :games, only: [:show]
  resources :match_histories
  post "/games", to: "games#create", as: 'games' 
  get "/", to: "summoners#new", as: "homepage"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
