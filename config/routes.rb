Rails.application.routes.draw do
  root :to => "users#collect_name"
  resources :users do
    collection do
      get :collect_name
    end
  end

end
