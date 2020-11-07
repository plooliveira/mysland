Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  resources :islands do
    resources :reservations, only: [:create]
  end

  get '/reservations', to: 'reservations#index'
  get '/reservations/:id', to: 'reservations#show', as: 'reservation'
  get '/reservations/:id/payment', to: 'reservations#payment', as: 'payment'
  get '/reservations/:id/payment_ok', to: 'reservations#payment_ok', as: 'payment_ok'


end
