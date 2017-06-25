Rails.application.routes.draw do
  get 'index' => 'home#index'
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :messages do
  	collection do
  		get :sent
  		get :received
  	end

  	member do
  		post 'mark_as_read'
  	end
  end
  resources :friendships
  root 'users#index'
  delete 'log_out' => 'sessions#destroy'
  get 'messages/sent' => 'messages#sent'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
