Rails.application.routes.draw do
	resources :users, only: [:new, :create, :show]
	get '/login', to: 'sessions#new'
	post '/login', to: 'sessions#create'
	delete '/logout', to: 'sessions#destroy'
	get '/', to: 'users#index'
	resources :events, only: [:new, :create, :show]
	get '/allevents', to: 'events#index'
end
