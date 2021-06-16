Rails.application.routes.draw do
  resources :sleep_cycles do
    member do
      put :end_sleep_cycle
    end
  end
  resources :follows
  root :to => "users#healthz"
  get '/healthz' => "users#healthz"
  resources :users do
    collection do
      get :collect_name
    end

    member do
      get :friend_sleeps
    end
  end
end
