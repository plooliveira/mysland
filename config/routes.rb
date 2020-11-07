Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'
  get '/about', to: 'pages#about'

  resources :islands do
    resources :reservations, only: [:create]
  end

  get '/reservations', to: 'reservations#index'
  get '/reservations/:id', to: 'reservations#show', as: 'reservation'
  get '/reservations/:id/payment', to: 'reservations#payment', as: 'payment'

end
