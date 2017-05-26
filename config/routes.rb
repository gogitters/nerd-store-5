Rails.application.routes.draw do
  get '/' => 'products#index'
  get '/products' => 'products#index'
  get '/products/new' => 'products#new'
  post '/products' => 'products#create'
  get '/products/:id' => 'products#show'
  get '/products/:id/edit' => 'products#edit'
  patch '/products/:id' => 'products#update'
  delete '/products/:id' => 'products#destroy'
  post '/search', to: 'products#index'

  get "/products/:product_id/images/new", to: 'images#new'
  post "/products/:product_id/images", to: 'images#create'

  # sign up
  get "/signup", to: 'users#new'
  post "/users", to: 'users#create'

  # login/logout
  get "/login", to: 'sessions#new'
  post "/login", to: 'sessions#create'
  get "/logout", to: 'sessions#destroy'

  # get "/orders/new", to: 'orders#new'
  post "/orders", to: 'orders#create'
  get "/orders/:id", to: 'orders#show'
end
