Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/dashboard', to: 'dashboard#bookings'
  resources :pets, only: [:index, :new, :show, :create, :edit, :update, :destroy] do
    resources :bookings, only: [:new, :create]
  end
end
