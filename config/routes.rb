Rails.application.routes.draw do
  get 'index' => 'home#index'
  resources :users

  resources :sessions, only: [:new, :create]

  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
