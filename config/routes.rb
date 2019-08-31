Rails.application.routes.draw do
  devise_for :users
  root to: 'restaurants#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :restaurants , only: [:index, :show] do
      resources :dishes, only: [:index, :show]
  end

  resources :bookings, only: [:show, :new, :create, :edit , :update, :delete]

  resources :users, only: :show

end
