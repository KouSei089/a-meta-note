Rails.application.routes.draw do
  root "top_pages#show"
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
