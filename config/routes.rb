Rails.application.routes.draw do
  get "/static_pages/:page", to: "static_pages#show"

  root "static_pages#show", page: "home"
  devise_for :users, controllers: {
    omniauth_callbacks: "omniauth_callbacks#create"
  }

  namespace :admin do
    resources :categories
  end
end
