Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "routes#index"

  resources :routes do
    collection do
      post 'test'
    end
  end
end
