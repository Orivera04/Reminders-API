Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :formatting_styles, only: [:index]
  resources :settings, only: [:index, :show, :create, :update, :destroy]
  resources :reminders, only: [:index, :show, :create, :update, :destroy]
  resources :telegram_triggers, only: [:create]
end
