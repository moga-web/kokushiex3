Rails.application.routes.draw do
  require 'sidekiq/web'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    delete 'users/guest_sign_out', to: 'users/sessions#guest_sign_out'
  end
  
  root to: 'top#index'
  get '/dashboard' => 'dashboard#index'
  #　TODO：registrationのeditをaccountにしたい
  get '/account' => 'accounts#show'

  
  namespace :tests do
    get '/select' => 'selections#index'
  end
  get '/tests/:id' => 'tests#show', as: 'test'
  resources :mini_tests, only: [:index, :create]

  resources :examinations do
    resources :scores, only: [:show]
  end
  
  resources :user_responses, only: [:create]
# 必要かわからないが一応追加
# 参考：https://qiita.com/lemonade_37/items/296bc211cf3e781c5600#:~:text=%E3%83%80%E3%83%83%E3%82%B7%E3%83%A5%E3%83%9C%E3%83%BC%E3%83%89%E3%81%AB%E3%81%AF%E4%B8%80%E8%88%AC%E3%83%A6%E3%83%BC%E3%82%B6%E3%83%BC%E3%81%AF%E3%82%A2%E3%82%AF%E3%82%BB%E3%82%B9%E3%81%A7%E3%81%8D%E3%81%AA%E3%81%84%E3%82%88%E3%81%86%E3%81%ABBasic%E8%AA%8D%E8%A8%BC%E3%82%92%E3%81%A4%E3%81%91%E3%82%8B%E3%81%AE%E3%81%8C%E6%9C%9B%E3%81%BE%E3%81%97%E3%81%84%E3%81%A7%E3%81%99
  mount Sidekiq::Web, at: '/sidekiq'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
