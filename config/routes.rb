Rails.application.routes.draw do
  root to: 'top#index'
  get '/dashboard' => 'dashboard#index'
end
