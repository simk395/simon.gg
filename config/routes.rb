Rails.application.routes.draw do
  resources :summoners
  resources :games, only: [:show]
  resources :match_histories
  post "/games", to: "games#create", as: 'games'
  get "/", to: "summoners#new", as: "homepage"
  delete "/summoners", to: "summoners#destroy", as: "log_out"
end
