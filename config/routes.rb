Rails.application.routes.draw do

  root 'home#index'

  get 'blog', to: 'home#blog', as: 'blog'
  get 'contact_us', to: 'home#contact_us', as: 'contact_us'
  get 'about_us', to: 'home#about_us', as: 'about_us'
  get 'portfolio', to: 'home#portfolio', as: 'portfolio'
  get 'services', to: 'home#services', as: 'services'
  get 'thank_you', to: 'home#thank_you', as: 'thank_you'

  resources :home
  devise_for :users, controllers: { registrations: :registrations, sessions: :sessions, passwords: :passwords }

  resources :dashboard do
    member do
      get :booking
      post :create_booking
    end
  end
  resources :configuration do
    member { get :hall_profile }
    collection { get :view }
  end
  resources :users
end
