Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "articles#index"

  # 1. Route maps a request to a controller action
  # 2. Controller action performs necessary work to handle the request and prepares any data for view; Controllers are Ruby classes and public methods are actions
  # 3. View displays data in desired format; views are templates usually written in mix of HTML and Ruby
  # GET /articles requests are mapped to the index action of ArticlesController
  # bin/rails generate controller Articles index --skip-routes
  # get "/articles", to: "articles#index"
  # get "/articles/:id", to: "articles#show"
  # Routes method named resources maps all of the conventional routes for a collection of resources
  # See bin/rails routes
  resources :articles
end
