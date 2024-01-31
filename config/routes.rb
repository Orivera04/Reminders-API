# frozen_string_literal: true

# Purpose: Define the routes for the application.
Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :chats
  resources :formatting_styles, only: [:index]
  resources :type_schedules, only: [:index]
  resources :settings
  resources :reminders
  resources :telegram_triggers, only: [:create]
  resources :telegram_jobs, only: [:index]
end
