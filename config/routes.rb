Rails.application.routes.draw do
  resources :summoners
  resources :games, only :show
  resources :match_histories, only :show
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
