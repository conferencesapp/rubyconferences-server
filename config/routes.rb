Rails.application.routes.draw do
  mount RailsAdmin::Engine => "/admin", as: "rails_admin"
  namespace :api, defaults: { format: "json" }  do
    namespace :v1 do
      resources :conferences, only: [:index]
      resources :devices, only: [:create]
    end

    namespace :v2 do
      resources :conferences, only: [:index]
    end

    namespace :v3 do
      resources :conferences, only: [:index]
    end
  end

  resources :conferences, only: [:new, :create]
  resources :announcements, only: :index do
    member do
      get :send_notification
    end
  end

  get "privacy" => "high_voltage/pages#show", id: "home"
end
