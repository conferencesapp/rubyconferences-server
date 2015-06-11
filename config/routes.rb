Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  namespace :api, :defaults => {:format => 'json'}  do
    namespace :v1 do
      resources :conferences, only: [:index, :show] do
        collection do
          get :past
        end
      end
      resources :devices, only: [:create]
    end
  end

  get 'privacy' => 'high_voltage/pages#show', id: 'home'
end
