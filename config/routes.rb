Rails.application.routes.draw do
  root to: 'questions#index'

  resources :questions
  resource :session, only: %i[create new destroy]
  resources :users, only: %i[create new]
end
