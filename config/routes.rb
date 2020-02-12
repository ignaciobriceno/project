Rails.application.routes.draw do
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'pages#index'
  get 'categories/index'
  get 'photographers/show'
  get 'photographers/edit'
  patch 'photographers/update'
  delete 'remove_categoryphotographers/categoryphotographer_id', to: 'category_photographers#destroy'
  resources :reservations
  resources :events
  
  resources :billings, only: [] do
    collection do
      get 'pre_pay'
    end
  end
  
  devise_for :photographers
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
