Rails.application.routes.draw do
  resources :events
  devise_for :photographers
  root 'pages#index'
  # get 'photographers/index'
   
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
