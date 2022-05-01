Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :formatting_styles, only: [:index]
  resources :configurations, only: [:create, :index, :update, :destroy]
end
