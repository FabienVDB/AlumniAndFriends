Rails.application.routes.draw do
  devise_for :users
  root to: "users#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: %i[index show] do
    resources :reservations, only: %i[index create] do
      resources :reviews, only: [:create]
    end
  end
  resources :reservations, only: :destroy
end
