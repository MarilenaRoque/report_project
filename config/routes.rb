require 'sidekiq/web'

Rails.application.routes.draw do
  resources :reports, only: [:index, :create]

  ### Creates a route to sidekiq panel
  ### Shouldn't be added on production
  mount Sidekiq::Web => '/sidekiq'
  # For details on the DSL a vailable within this file, see https://guides.rubyonrails.org/routing.html
end
