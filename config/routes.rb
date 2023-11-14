Rails.application.routes.draw do
  devise_for :users

  root 'rooms#index'
  resources :rooms

  get 'up' => 'rails/health#show', as: :rails_health_check
end
