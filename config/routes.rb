Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'registrations', sessions: 'sessions', passwords: 'passwords' }
  root 'dashboard#index'

  resources :dashboard
  resources :configuration do
    member { get 'hall_profile' }
    collection { get 'view' }
  end
  resources :users
end
