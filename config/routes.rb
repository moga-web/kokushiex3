Rails.application.routes.draw do
    devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }
  
  root to: 'top#index'
  get '/dashboard' => 'dashboard#index'
  #　TODO：registrationのeditをaccountにしたい
  get '/account' => 'accounts#show'

  
  namespace :tests do
    get '/select' => 'selections#index'
  end
  get '/tests/:id' => 'tests#show', as: 'test'

  resources :examinations do
    resources :scores, only: [:create, :show]
  end
  
  resources :user_responses, only: [:create]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
