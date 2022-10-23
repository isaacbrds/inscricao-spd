Rails.application.routes.draw do
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :subscripts, only: %i(index create new)
  namespace :api do
    namespace :v1 do
      resources :subscripts, only: :index
    end
  end
  # Defines the root path route ("/")
  root 'home#index'
end
