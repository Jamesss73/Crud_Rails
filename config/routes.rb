Rails.application.routes.draw do
  get 'products/index'
  resources :products
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root :to => "products#index"
end

