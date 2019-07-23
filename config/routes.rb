Rails.application.routes.draw do
  resources :exercise_records
  resources :meal_records
  namespace :api, constraints: { format: 'json' } do
    get 'sessions/new'
    resources :exercise_muscles
    resources :exercises
    resources :muscles
    resources :meals
    resources :exercise_records
    resources :meal_records

    post '/login',  to:'sessions#create'
    delete '/logout', to:'sessions#destroy'
    get '/validate', to:'sessions#validate'
    post '/signup', to:'sessions#signup'
  end
  root 'application#hello'
end
