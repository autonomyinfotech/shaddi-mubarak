Rails.application.routes.draw do

  root 'home#home'

  get 'home', to: 'home#home', as: 'home'
  get 'blog', to: 'home#blog', as: 'blog'
  get 'contact_us', to: 'home#contact_us', as: 'contact_us'
  get 'about_us', to: 'home#about_us', as: 'about_us'
  get 'portfolio', to: 'home#portfolio', as: 'portfolio'
  get 'services', to: 'home#services', as: 'services'
  get 'sign_out', to: 'home#sign_out', as: 'sign_out'

  devise_for :users, controllers: { registrations: :registrations }

  resources :dashboard

  resources :configuration do
    member { get :hall_profile }
    collection do
      get :edit
      get :view
      get :profile
    end
  end
  resources :users do
    collection { get :profile }
  end

  resources :events
end
