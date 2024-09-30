Rails.application.routes.draw do
  root "tops#index"
  resources :users, only: %i[new create destroy]

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  get '/explanation/', to: "tops#explanation"
end
