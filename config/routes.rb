Rails.application.routes.draw do
  devise_for :users
  root to: 'restaurants#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :restaurants , only: [:index, :show] do
      resources :dishes, only: [:index, :show]
      resources :bookings, only: [:show, :new, :create]  do
        resources :attendees, only: [:new, :create, :destroy]
        resources :reviews, only: [:create, :delete]
      end
  end

  resources :users, only: :show


end
