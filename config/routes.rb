Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'welcome#index', as: "root"

  resources :users
  resources :entries
  # SESSION ROUTES
  get '/login' => 'sessions#new', as: 'login'
  post '/sessions' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  # REPORTS ROUTES
  get '/reports' => 'reports#index', as: 'reports'

end
