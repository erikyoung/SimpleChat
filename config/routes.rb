Rails.application.routes.draw do
  get 'index' => 'home#index'
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :messages
  resources :friendships
  root 'home#index'
  get 'log_out' => 'sessions#destroy'
  get 'messages/sent'
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
