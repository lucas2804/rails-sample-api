Rails.application.routes.draw do
  root :to => "users#index"
  resources :tweets
  resources :users
end
