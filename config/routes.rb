Rails.application.routes.draw do

  resources :trips, only: %i[index show]
  resources :trails, only: [:show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
