Bulldogsvolleyballcom::Application.routes.draw do
  match '/admin' => 'admin/dashboard#index', :as => :admin_dashboard
  namespace :admin do
    resources :announcements
    resources :events
    resources :stories
    resources :newspapers
  end

  devise_for :administrators, :path => "admin", :controllers => { :sessions => "admin/administrator_sessions" }

  match 'super_scrimmage' => 'super_scrimmage#index', :as => :super_scrimmage
  match 'news/:id' => 'news#show', :as => :story
  match 'news' => 'news#index', :as => :news
  match 'calendar/:id' => 'events#show', :as => :event
  match 'calendar' => 'calendar#index', :as => :events
  match 'calendar/:year/:month' => 'calendar#index', :as => :month

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'homepage#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
