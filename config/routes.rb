Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'
  get '/about', to: 'pages#about'

  resources :islands do
    resources :reservations, only: [:new, :create]
  end

  get '/reservations', to: 'reservations#index'
  get '/reservations/:id', to: 'reservations#show'

end
