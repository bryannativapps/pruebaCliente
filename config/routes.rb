Rails.application.routes.draw do
  root "tours#index"
  devise_for :users
  
  resources :tours
  
  #api
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :vehicles
    end
  end
end
