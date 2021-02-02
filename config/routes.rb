Rails.application.routes.draw do
  get 'bookings/new'
  get 'bookings/create'
  #get 'booking/new'
  #get 'booking/create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'pages#home'

  devise_for :users

  resources :dogs, only: [:index, :show, :new, :create, :destroy] do
    resources :bookings, only: [:index, :new, :create]
  end
end
