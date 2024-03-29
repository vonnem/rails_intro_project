Rails.application.routes.draw do
  resources :about, only: [:index]
  # get 'home/index'
  root to:'home#index'
  # get 'studios/index'
  # get 'studios/show'
  # get 'animes/index'
  # get 'animes/show'
  resources :animes, only: [:index, :show] do
    collection do
      get "search"
    end
  end
  resources :studios, only: [:index, :show] do
    collection do
      get "search"
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
