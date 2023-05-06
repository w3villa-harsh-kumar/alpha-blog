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
  # Defines the users path route ("/users")
  resources :users, except: [:new] # => Restful Routes
end
