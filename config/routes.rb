Rails.application.routes.draw do
  devise_for :users
  get 'refrigerators/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "refrigerators#index"
  resources :users do
  end
  
end
