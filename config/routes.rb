Rails.application.routes.draw do
  # get 'balances/index'
  # get 'products/new'
  # get 'products/edit'
  # get 'products/show'
  # get 'customers/edit'
  # get 'customers/new'
  # get 'customers/show'
  # get 'updates/index'
  # get 'adds/index'
  get 'publics/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'publics#index'
  devise_scope :user do
    authenticated :user do
      resources :products
      resources :suppliers
      resources :customers
      get 'adds/index'
      get 'updates/index'
      get 'updates/list_s'
      get 'updates/list_c'
      get 'updates/list_p'
      root 'adds#index', as: :authenticated_user_root
    end
  end
  devise_scope :manager do
    authenticated :manager do
      resources :products, :only => [:update, :show]
      resources :suppliers, :only => [:show]
      resources :customers, :only => [:show]
      get 'balances/index'
      root 'balances#index', as: :authenticated_manager_root
    end
  end
  devise_for :users
  devise_for :managers
  root 'publics#index'
#   devise_for :users, controllers: { registrations: "registrations"}
end
