Rails.application.routes.draw do

resources :profiles
  root to: 'profiles#index'
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  # get 'welcome#index'
  #
  # root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
