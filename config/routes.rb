Rails.application.routes.draw do
  devise_for :users
  root to: "users#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "users", to: "users#index"
  get "users/:id", to: "users#show"
  get "users/:id/reservations", to: "reservations#index"
end
