require "sidekiq/web"

Rails.application.routes.draw do
  resources :menu_items
  resources :categories
  resources :products
  resource :menu
  resources :baskets do
    resource :order
  end
  resources :basket_items, only: [:create, :destroy] do
    member do
      patch :increment
      patch :decrement
    end
  end

  get "/privacy", to: "home#privacy"
  get "/terms", to: "home#terms"
  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => "/sidekiq"

    namespace :madmin do
    end
  end

  resources :notifications, only: [:index]
  resources :announcements, only: [:index]
  devise_for :users, controllers: {omniauth_callbacks: "users/omniauth_callbacks"}

  root to: "menus#show"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
