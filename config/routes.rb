Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :subscripts, only: %i(index create new)
  namespace :api do
    namespace :v1 do
      resources :subscripts, only: %i(index create)
    end
  end
  # Defines the root path route ("/")
  root 'home#index'
end
