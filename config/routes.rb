Rails.application.routes.draw do
  devise_for :users
  root to: "users#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show] do
    resources :reservations, only: :index
  end
end
