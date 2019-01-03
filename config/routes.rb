Rails.application.routes.draw do

  root "static_pages#home"
  get "users/show"
  get "users/new"
  get "/help", to: "static_pages#help"
  get "/about", to: "static_pages#about"
  get "/contact", to: "static_pages#contact"
  get "/login", to: "sessions#new" #User
  post "/login", to: "sessions#create"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  delete "logout" => "sessions#destroy"
  get "/newauthors", to: "authors#new" #Author
  get "/authors", to: "authors#index"
  get "/newpublishers", to: "publishers#new"
  get "/publishers", to: "publishers#index"
  resources :users
  resources :authors, :publishers
end
