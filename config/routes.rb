Rails.application.routes.draw do
  root :to => "users#collect_name"
  get '/healthz' => "users#healthz"
  resources :users do
    collection do
      get :collect_name
    end
  end
end
