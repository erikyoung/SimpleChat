Rails.application.routes.draw do
  get 'index' => 'home#index'
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  root 'home#index'
  get 'log_out' => 'sessions#destroy'

  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
