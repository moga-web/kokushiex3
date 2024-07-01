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

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
