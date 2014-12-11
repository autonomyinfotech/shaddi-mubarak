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

  resources :hall do
    collection do
      get :edit
      get :view
      get :profile
      patch :update
    end
  end
  resources :users do
    collection { get :profile }
  end
  resources :events
  resources :customers do
    collection do
      get :edit
      post :service
    end
  end
  resources :settings do
    collection do
      get :add_event
      post :create_event
      get :add_service
      post :create_service
      get :add_outsource
      post :create_outsource
    end
  end
end
