Rails.application.routes.draw do
  resources :groups
  resources :entities
  get 'splash/index'
  devise_for :users, :controllers => {:registrations => "registrations"}


  # resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "splash#index"
end
