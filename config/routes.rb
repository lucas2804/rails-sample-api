Rails.application.routes.draw do
  resources :conversations, only: [:create]do
    resources :messages, only: [:create] # enum status: { unseen: 0, seen: 1 }
    member do
      delete :close
    end
  end

  resources :retweets
  root :to => "users#index"
  resources :tweets
  resources :users
end
