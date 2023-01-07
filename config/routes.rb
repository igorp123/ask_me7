Rails.application.routes.draw do
  root to: 'questions#index'

  resources :questions
  resources :users, only: %i[create new]
end
