Rails.application.routes.draw do
  root "top_pages#show"
  resources :schedules
  resources :users
  get 'login' => 'user_sessions#new', :as => :login
  post 'login' => "user_sessions#create"
  post 'logout' => 'user_sessions#destroy', :as => :logout
end
