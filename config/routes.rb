require 'sidekiq/web'
Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  mount Sidekiq::Web => '/sidekiq'

  resources :users do
    collection do
      post :upload_data, path: 'upload-data', as: "upload_data"
      delete :destroy_multiple, path: 'destroy-multiple', as: "destroy_multiple"
      post :index
    end
  end
end
