Rails.application.routes.draw do
  get 'publics/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'publics#index'
  devise_scope :user do
    authenticated :user do
      resources :products
      resources :suppliers
      resources :customers
      resources :purchases
      resources :sales
      resources :managers
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
      get 'summaries/list'
      get 'summaries/prod'
      get 'summaries/index'
      resources :inflows
      resources :outflows
      # get 'inflows/new'
      # get 'inflows/index'
      # get 'inflows/show'
      # get 'inflows/update_products', as: 'update_products'
      # get 'inflows/_product'
      root 'balances#index', as: :authenticated_manager_root
    end
  end
  devise_scope :purchase do
    authenticated :purchase do
      get 'reorders/index'
      get 'reorders/reorder'
      get 'summaries/list'
      get 'summaries/prod'
      get 'summaries/index'
      resources :inflows, :only => [:show]
      resources :outflows, :only => [:show]
      resources :products
      resources :suppliers, :only => [:show]
      root 'reorders#index', as: :authenticated_purchase_root
    end
  end
  
  devise_scope :sale do
    authenticated :sale do
      resources :orders
      get 'orders/new'
      get 'reminders/index'
      get 'summaries/list'
      get 'summaries/prod'
      get 'summaries/index'
      root 'orders#new', as: :authenticated_sale_root
    end
  end
  devise_for :users
  devise_for :managers
  devise_for :purchases
  devise_for :sales
  root 'publics#index'
#   devise_for :users, controllers: { registrations: "registrations"}
end
