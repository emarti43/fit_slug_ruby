Rails.application.routes.draw do
  get 'sessions/new'
  resources :exercise_muscles
  resources :exercises
  resources :muscles
  resources :meals
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#hello'
end
