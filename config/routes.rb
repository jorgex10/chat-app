Rails.application.routes.draw do
  devise_for :users

  root 'rooms#index'

  post 'add/user', to: 'rooms#add_user'
  resources :rooms do
    resources :messages
  end

  namespace :api do
    resources :users, only: %i[index create]
  end

  get 'up' => 'rails/health#show', as: :rails_health_check
end
