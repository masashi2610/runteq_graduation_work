Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  root "tops#index"
  resources :users, only: %i[new create destroy]
  resources :password_resets, only: %i[new create edit update]
  resources :spikes, only: %i[index show create new edit update destroy]


  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  get '/explanation/', to: "tops#explanation"
end
