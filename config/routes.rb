Rails.application.routes.draw do
  root 'gossips#index'
  resource :session, only: [:new, :create, :destroy]
  resources :comments
  resources :gossips do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end
  resources :users, only: [:show, :new, :create]
  resources :cities, only: [:show]
  get "welcome/:user_name", to: 'welcome#hello', as: 'welcome'
  get "/contact", to: 'pages#contact'
  get "/team", to: 'pages#team'

  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
