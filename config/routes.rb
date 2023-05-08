Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"

  # Defines the about path route ("/about")
  get "/about", to: "pages#about"

  # Defines the articles path route ("/articles")
  resources :articles # , only: [:show, :index, :create, :new, :edit, :update, :destroy] => Restful Routes => https://guides.rubyonrails.org/routing.html#crud-verbs-and-actions

  # Defines the signup path route ("/signup")
  get "/signup", to: "users#new"

  #Defines the login path route ("/login")
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"

  #Defines the logout path route ("/logout")
  delete "/logout", to: "sessions#destroy"

  # Defines the users path route ("/users")
  resources :users, except: [:new] # => Restful Routes

  # 404 page
  get "*path", to: "pages#not_found", constraints: lambda { |req| req.path.exclude? "rails/active_storage" }
end


# except and only are options that can be passed to the resources method to specify which routes to generate
# except: [:new] will generate all routes except the new route
# only: [:new] will generate only the new route

# The routes generated by the resources method are as follows:
# GET /users => users#index
# GET /users/new => users#new
# POST /users => users#create
# GET /users/:id => users#show
# GET /users/:id/edit => users#edit
# PATCH /users/:id => users#update
# PUT /users/:id => users#update
# DELETE /users/:id => users#destroy

# constraints: lambda { |req| req.path.exclude? "rails/active_storage" } is used to exclude the routes generated by the resources method for Active Storage 
# lambda { |req| req.path.exclude? "rails/active_storage" } is a lambda function that takes in a request object and returns true if the path does not include "rails/active_storage" and false otherwise
# req.path is the path of the request object
# req.path.exclude? "rails/active_storage" returns true if the path of the request object does not include "rails/active_storage" and false otherwise