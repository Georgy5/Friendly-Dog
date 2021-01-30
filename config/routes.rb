Rails.application.routes.draw do
  get 'booking/new'
  get 'booking/create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'pages#home'

  devise_for :users

  resources :dogs, only: [:index, :show, :new, :create, :destroy]
end
