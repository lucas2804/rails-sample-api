Rails.application.routes.draw do
  resources :sleep_cycles
  resources :follows
  root :to => "users#collect_name"
  get '/healthz' => "users#healthz"
  resources :users do
    collection do
      get :collect_name
    end
  end
end
