Rails.application.routes.draw do
  devise_for :users
  root to: 'restaurants#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :restaurants , only: [:index, :show] do
      resources :dishes, only: [:index, :show]
      resources :bookings, only: [:show, :new, :create]  do
        resources :reviews, only: [:show, :create, :delete]
        resources :attendees, only: [:index, :new, :create, :destroy] do
          resources :orders
        end
      end
  end

  resources :users, only: [:show, :edit] do
    get "reviews", to: "users#reviews", as: :reviews
    get "bookings", to: "users#bookings", as: :bookings
  end
end
