Rails.application.routes.draw do
  root to: "profiles#index"
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  resources :profiles
end
