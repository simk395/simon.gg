Rails.application.routes.draw do
<<<<<<< HEAD
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
=======
>>>>>>> c99cf2eb7761dadb415e0f59cf9b0d1d64bd72ef
  resources :summoners
  resources :games
  resources :match_histories
  get "/", to: "summoners#new", as: "homepage"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
