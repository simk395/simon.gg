Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :summoners
  resources :games
  resources :match_histories
  get "/", to: "summoners#new", as: "homepage"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
