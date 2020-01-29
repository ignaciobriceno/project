Rails.application.routes.draw do
  get 'reservations/create'
  get 'reservations/index'
  resources :events
  root 'pages#index'
  devise_for :photographers
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
