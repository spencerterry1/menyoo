Rails.application.routes.draw do
  devise_for :users
  root to: 'restaurants#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :restaurants , only: [:index, :show] do
      resources :dishes, only: [:index, :show]
      resources :bookings, only: [:show, :new, :create]  do
        get 'summary', to: 'bookings#summary'
        resources :reviews, only: [:create, :delete]
        resources :attendees, only: [:index, :new, :create, :destroy] do
          get 'accept', to: 'attendees#accept'
          resources :orders
          resources :payments, only: [:new, :create]
        end
      end
  end

  resources :users, only: :show
  get "previous-bookings", to: "users#previous_bookings", as: :previous_bookings


end
