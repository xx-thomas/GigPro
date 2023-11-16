Rails.application.routes.draw do
  get 'sessions/new'
  # get 'users/new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
	root "gigs#index"
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
	#   get "/gigs", to: "gigs#index"
	#   get "/gigs/:id", to: "gigs#show"
	get "/signup", to: "users#new"
	get "/login", to:"sessions#new"
	post "/login", to:"sessions#create"
	delete "/logout", to:"sessions#destroy"
	resources :customers
	resources :workers
	resources :gigs do
		member do
			post 'complete'
		end
	end
	resources :users
  # Defines the root path route ("/")
  # root "posts#index"

  # Route for changing language
  get '/change_language', to: 'application#change_language', as: :change_language
end
