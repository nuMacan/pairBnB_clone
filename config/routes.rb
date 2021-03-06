 Rails.application.routes.draw do

   root 'home#homepage'
   # get 'home/index'

  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "sessions", only: [:create, :edit]

  resources :users, controller: "users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
    #there are 7 routes for each object, since you use 'only' dont forget to specify everything.
    resources :listings, 
      controller: "listings", only: [:create, :edit, :update, :new]
      get "/listings" => "listings#create", as: "listings_create"

  end

  resources :listings, 
  controller: "listings", only: [:index, :show]
  
  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
     #to show all this info, need to justtify it in routes using resources
 
  #create custom route for superadmin to be able to verify listing
   post '/listings/:id/verify' => "listings#verify", as: "verify"

 end
