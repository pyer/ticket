Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check


#  resources :dashboards
  root :to => 'help#index', :as => 'home'

  get 'home'            => 'home#index'
  get 'dashboard'       => 'dashboards#index'
  get 'issues'          => 'issues#index'
  get 'issues/index'    => 'issues#index'
  get 'issues/new'      => 'issues#new'
  get 'issues/edit'     => 'issues#edit'
  get 'projects'        => 'projects#index'
  get 'projects/index'  => 'projects#index'
  get 'projects/new'    => 'projects#new'
  get 'projects/edit'   => 'projects#edit'
  get 'projects/remove' => 'projects#remove'
  get 'users'           => 'users#index'
  get 'help'            => 'help#index'
  get 'login'           => 'users#login'
  get 'logout'          => 'users#logout'
  get '*', :to => 'error#not_found'

  post 'login'          => 'users#login'
  post 'project/create' => 'projects#create'
  post 'project/update' => 'projects#update'
  post 'project/delete' => 'projects#delete'
  post 'issue/create'   => 'issues#create'
  post 'issue/update'   => 'issues#update'
  post 'issue/move'     => 'issues#move'
  post 'issue/delete'   => 'issues#delete'

#  get '*', :to => 'error#not_found'
  get "*any", via: :all, to: "error#not_found"

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
  #       post 'toggle'
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
