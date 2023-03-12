require 'sidekiq/web'
require 'sidekiq/cron/web'
Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  mount Sidekiq::Web => '/sidekiq'

  resources :users, only: [:index, :new, :edit, :show, :update, :create] do
    collection do
      post   :upload_data,        path: 'upload-data',      as: 'upload_data'
      # Added temporarily to upload data in case Postman is not available
      get    :upload_data,        path: 'upload/data'
      delete :destroy_multiple,   path: 'destroy-multiple', as: 'destroy_multiple'
      post   :index,              path: 'post-index',       as: 'post_index'
    end
  end

  root to: "users#index"
end
