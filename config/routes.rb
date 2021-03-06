Rails.application.routes.draw do
  namespace :api, constraints: { format: 'json' } do
    get 'sessions/new'
    get 'meals_fields', to: 'meals#fields'
    resources :exercise_muscles, only: [:index, :update, :create, :destroy]
    resources :exercises, only: [:index, :update, :create, :destroy]
    resources :muscles, only: [:index, :update, :create, :destroy]
    resources :meals, only: [:index, :update, :create, :destroy]
    resources :exercise_records, only: [:index, :update, :create, :destroy]
    resources :meal_records, only: [:index, :update, :create, :destroy]

    post '/login',  to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'
    get '/validate', to: 'sessions#validate'
    post '/signup', to: 'sessions#signup'
    get '/recent_meals', to: 'meal_records#recent_meals'
    get '/recent_exercises', to: 'exercise_records#recent_exercises'
    
  end
  root 'application#hello'
end
