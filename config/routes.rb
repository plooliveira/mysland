Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'
  get '/about', to: 'pages#about'

  resources :islands do
    resources :reservations, only: [:create]
  end

  get '/dashboard', to: "islands#dashboard", as: 'dashboard'
  get '/reservations', to: 'reservations#index'
  get '/reservations/:id', to: 'reservations#show', as: 'reservation'
  get '/reservations/:id/payment', to: 'reservations#payment', as: 'payment'
  get '/reservations/:id/confirmation', to: 'reservations#confirmation', as: 'confirmation'
  get '/reservations/:id/cancelation', to: 'reservations#cancelation', as: 'cancelation'
  

end
