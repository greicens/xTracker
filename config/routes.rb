Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'welcome#index', as: "root"

  resources :users do
    resources :entries
  end
  resources :categories
  # SESSION ROUTES
  get '/login' => 'sessions#new', as: 'login'
  post '/sessions' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  # REPORTS ROUTE
  get '/reports' => 'reports#index', as: 'reports'
  # DASHBOARD ROUTE
  get '/dashboard' => 'dashboard#index', as: 'dashboard'



end
