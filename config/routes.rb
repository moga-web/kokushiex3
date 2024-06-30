Rails.application.routes.draw do
  get 'accounts/show'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }
  
  root to: 'top#index'
  get '/dashboard' => 'dashboard#index'
  get '/account' => 'accounts#show'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
