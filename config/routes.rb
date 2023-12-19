Rails.application.routes.draw do
  get 'sessions/new'
	root "gigs#index"
  get "up" => "rails/health#show", as: :rails_health_check
	get "/signup", to: "users#new"
	get "/login", to:"sessions#new"
	post "/login", to:"sessions#create"
	delete "/logout", to:"sessions#destroy"
	resources :gigs do
		member do
			post 'complete'
			post 'accept'
		end
	end
	resources :notifications
	resources :users
	resources :ratings


  #get '/ratings', to: 'ratings#index'
  #get '/ratings/new', to: 'ratings#new'



  # Route for changing language
  get '/change_language', to: 'application#change_language', as: :change_language
end
