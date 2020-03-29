Rails.application.routes.draw do
  resources :retweets
  root :to => "users#index"
  resources :tweets
  resources :users
end
