Rails.application.routes.draw do
  devise_for :users
  root to: "tours#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"

  # Defines the routes for the posts resource
  resources :tours, only: [:index, :show, :new, :create] do
    resources :bookings, only: [:new, :create, :show] do
      resources :reviews, only: [:new, :create]
        member do
          patch :accept
          patch :reject
          patch :cancel
          patch :complete
          patch :no_show
          patch :refund
        end
    end
  end

  # not needed?
  get "users/:id" => "users#show", as: :user

  resources :users, only: [:show] do
    resources :reviews, only: [:index, :destroy]
  end

  get "bookings/:id/edit" => "bookings#edit", as: :booking_edit
  patch "bookings/:id" => "bookings#update", as: :booking
  delete "bookings/:id" => "bookings#destroy", as: :booking_destroy


end
