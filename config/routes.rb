Rails.application.routes.draw do
  root "top_pages#show"
  resource :regulation, only: [:terms, :privacy] do
    collection do
      get 'terms'
      get 'privacy'
    end
  end
  resources :schedule_bases, only: [:index, :create, :show, :destroy]
  resources :schedules do
    resources :tasks, only: [:new, :create]
  end
  resources :tasks, only: :destroy 
  resources :categories, except: :show
  resources :users, only: [:new, :create]
  get 'login' => 'user_sessions#new', :as => :login
  post 'login' => "user_sessions#create"
  post 'logout' => 'user_sessions#destroy', :as => :logout
end
