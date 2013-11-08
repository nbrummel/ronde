Ronde::Application.routes.draw do

  devise_scope :user do 
    get "/logout", :to => "devise/sessions#destroy" # Add a custom sign in route for user sign in
    get "/register", :to => "devise/registrations#new" # Add a Custom Route for Registrations
    get "/profile/edit", :to => "devise/registrations#edit"
    get "/profile/password", :to => "devise/passwords#edit"
  end

  resources :friendships


  get "static/about"
  get "static/tour"
  get "static/home"
  get "static/terms_of_use"
  get "static/contact"
  get "/dashboard", :to => "dashboard#index", :as => 'user_dashboard'
  get "/profile", :to => "profile#index", :as => 'user_profile'
  get "/user/:id/friends", :to => "user#friends", :as => 'user_friends'
  post "/user/:id/search_friend", :to => "user#search_friend"
  post "/user/:id/add_friend/:friend_id", :to => "user#add_friend"
  get "/user/:id/reject_friend/:friend_id", :to => "user#reject_friend"
  post "user/:id/accept_friend/:friend_id", :to => "user#accept_friend"
  delete "/user/:id/remove_friend/:friend_id", :to => "user#remove_friend"


  devise_for :users, :controllers => { :omniauth_callbacks =>  "omniauth_callbacks" }#, :path_names => {:edit => "profile/edit", :sign_in => "login", :sign_out => "logout", :sign_up => "register" }
 	
  root :to => 'static#home'
end

# :path_names => {:edit => "profile/edit", :sign_in => "login", :sign_out => "logout", :sign_up => "register" }
