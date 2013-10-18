Ronde::Application.routes.draw do
  get "static/about"
  get "static/tour"

  devise_for :users, :controllers => { :omniauth_callbacks =>  "omniauth_callbacks" }

  root to: 'static#home'
end
