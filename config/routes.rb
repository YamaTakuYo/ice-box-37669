Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  get 'refrigerators/index'
  root to: "refrigerators#index"
  resources :users, only: [:edit, :update]
  resources :refrigerators do
  end
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
end
