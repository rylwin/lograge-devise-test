Rails.application.routes.draw do
  devise_for :user
  root "application#index"
  get "/simulate_devise_timeout", controller: "application", action: "simulate_devise_timeout"
  get "/simulate_regular_401", controller: "application", action: "simulate_regular_401"
end
