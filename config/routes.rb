Rails.application.routes.draw do
  resources :scorecards
  resources :subject_scores
  resources :users
  resources :class_rooms
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
