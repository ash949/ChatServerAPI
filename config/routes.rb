Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount ActionCable.server => '/cable'
  
  resources :rooms do
    resources :messages
  end
  
  resources :users do
    resources :messages
  end
  
end
