Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }
  
  root to: 'top#index'
  get '/dashboard' => 'dashboard#index'

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
