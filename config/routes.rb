Rails.application.routes.draw do
  get 'photographers/show'
  get 'photographers/edit'
  patch 'photographers/update'
  delete 'remove_categoryphotographers/categoryphotographer_id', to: 'category_photographers#destroy'
  resources :reservations
  resources :events
  root 'pages#index'
  devise_for :photographers
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
