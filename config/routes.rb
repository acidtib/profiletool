Thomasite::Application.routes.draw do

  get "comments/create"

  get "comments/destroy"

  #resources :website_pages, :path => "pages"
  namespace :blog do 
    resources :posts do 
      resources :comments 
    end 
  end 


  constraints (Sky::IsAppSite) do

    namespace :dashboard do

      resource :user
      resource :website

      resources :website_pages, :path => "pages"
      resources :workouts
      resources :thoughts

      root :to => 'dashboard#index'
    end

    match 'signup' => 'user#new', :as => 'new_user', :via => :get
    match 'signup' => 'user#create', :as => 'new_user', :via => :post
    match 'login'  => 'user_session#new', :as => 'new_user_session', :via => :get
    match 'login'  => 'user_session#create', :as => 'new_user_session', :via => :post
    match 'logout' => 'user_session#logout', :as => 'destroy_user_session'
    match 'twitter' => 'social#twitter', :as => 'social_twitter'

    root :to => 'public#app_homepage'

  end

  match '*other' => 'public#path'

  root :to => 'public#root'

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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
