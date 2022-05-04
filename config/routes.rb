Rails.application.routes.draw do
  root "top_pages#show"

  resources :schedules
end
