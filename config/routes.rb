Rails.application.routes.draw do
  # Authentication
  get  "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"
  get  "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"
  resources :sessions, only: [ :index, :show, :destroy ]
  resource  :password, only: [ :edit, :update ]
  namespace :identity do
    resource :email,              only: [ :edit, :update ]
    resource :email_verification, only: [ :show, :create ]
    resource :password_reset,     only: [ :new, :edit, :create, :update ]
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
  root "v1/home#index"

  # V1
  namespace :v1, path: "/" do
    # Dashboard
    namespace :dashboard do
      # Images
      post "images/create_from_file"
      put "images/update_sort"

      # Places
      resources :places

      # Listings
      resources :listings
    end

    # Public
    get :search, to: "home#search"

    # Listings
    get "listings/:place_slug/:listing_type_key", to: "listings#directory", as: :listings_directory
    resources :listings, only: [ :show ] do
      member do
        get :images, to: "listings#images"
      end
    end

    # Outbound Clicks
    get "out", to: "outbound_clicks#track_click"

    # Places
    resources :places, only: [ :show ] do
      member do
        get :images, to: "places#images"
      end
    end
  end
end
