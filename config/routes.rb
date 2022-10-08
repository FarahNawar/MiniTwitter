Rails.application.routes.draw do
  root "users#new"
  get 'static_pages/home'
  get 'static_pages/help'

  get 'log_in', to: 'sessions#new', as: :login
  post 'log_in', to: 'sessions#create'
  delete 'log_out', to: 'sessions#destroy', as: :logout
  resources :microposts
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

end
