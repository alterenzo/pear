Rails.application.routes.draw do
  resources :profiles
  root to: 'profiles#index'
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
end
