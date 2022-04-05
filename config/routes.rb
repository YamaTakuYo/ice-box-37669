Rails.application.routes.draw do
  devise_for :users
  get 'refrigerators/index'
  root to: "refrigerators#index"
  resources :users, only: [:edit, :update]
  resources :refrigerators do
  end
end
