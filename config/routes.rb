CornellRadio::Application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :page_contents, only: [:update, :edit]
  resources :show_users, only: [:new, :create, :destroy]
  resources :shows
  resources :podcasts
  resources :audio, :only => :new
  resources :posts
  resources :users

  root 'static_pages#home'
  match '/signout', to: 'sessions#destroy', via: 'delete'
  match '/about', to: 'static_pages#about', via: 'get'
  match '/schedule', to: 'static_pages#schedule', via: 'get'
  match '/shows', to: 'static_pages#shows', via: 'get'
  match '/personalities', to: 'static_pages#personalities', via: 'get'
  match '/media', to: 'static_pages#media', via: 'get'
  match '/win', to: 'static_pages#win', via: 'get'
  match '/events', to: 'static_pages#events', via: 'get'
  match '/get_involved', to: 'static_pages#get_involved', via: 'get'
  match '/sports', to: 'static_pages#sports', via: 'get'
  match '/connect', to: 'static_pages#connect', via: 'get'
  match '/userposts/:id', to: 'static_pages#userposts', via: 'get'
  match '/showposts/:id', to: 'static_pages#showposts', via: 'get'
  match '/admin', to: 'sessions#new', via: 'get'

  mount Ckeditor::Engine => '/ckeditor'

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
