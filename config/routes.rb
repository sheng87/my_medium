
Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  namespace :api do 
    post :upload_image, to: 'utils#upload_image'
    resources :users, only: [] do
      member do 
        post :follow
      end
    end
    
    resources :stories, only: [] do 
      member do
        post :clap
        post :bookmark
      end
    end
  end 
    

  resources :users, only: [] do
    collection do
      get :pricing   # /users/pricing
      get :payment   # /users/payment
      post :pay      # /users/pay
    end
  end


  resources :stories do 
    resources :comments, only: [:create]
  end

  get '@:username/:story_id', to: 'pages#show', as: 'story_page'

  get '@:username', to: 'pages#user', as: 'user_page'

  get "/demo", to: 'pages#demo'
  root 'pages#index'
end