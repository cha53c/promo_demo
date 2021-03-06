Rails.application.routes.draw do

  devise_for :users, controllers: {registrations: :registrations}

  # Administration
  # TODO change name of url
  get 'administration/index'

  get 'users/:id', to: 'users#show', as: :user
  get 'users/', to: 'users#index'
  delete 'users/:id', to: 'users#destroy', as: :destroy_user

  # search
  get 'search/index'
  get 'search/fuzzy'

  root 'home#index'

  resources :clients do
    resources :promotions
  end

  get 'promotions', to: 'promotions#index', as: :promotions

  # TODO should not need this should be able to use the standard resources without the new
  post '/clients/:client_id/promotions/new' => 'promotions#create'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'Ì
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
