Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/dashboard', to: 'dashboard#bookings'
  resources :pets, only: [:index, :new, :show, :create, :edit, :update, :destroy] do
    resources :bookings, only: [:new, :create, :destroy]
  end
  resources :bookings, only: [:index, :update] do
    patch :accept, on: :member
    patch :refuse, on: :member
  end
end
