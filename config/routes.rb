Rails.application.routes.draw do
  get 'storage_areas/api/v1'
  get :search, controller: :main
  get :notifications, controller: :main

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'storage_areas#index', as: 'home'
  
  resources :storage_areas do
    resources :storage_locations do
      put :incCur, :decCur, :incMax, :decMax, :incDef, :decDef
    end
  end
  
  # this is for the api
  namespace :api do
    namespace :v1 do
      resources :storage_areas, only: [:index, :create, :show, :update, :destroy] do
        resources :storage_locations, only: [:index, :create, :show, :update, :destroy]
      end
    end
  end
end
