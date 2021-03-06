Photart::Application.routes.draw do
  resources :articles

  resources :maingalls

  resources :galleries

  resources :pictures

  resources :posts

  devise_for :users, :skip => :registrations
  devise_scope :user do
    resource :registration,
    :only => [:new, :create, :edit, :update],
    :path => 'users',
    :path_names => { :new => 'sign_up' },
    :controller => 'devise/registrations',
    :as => :user_registration do
      get :cancel
    end
  end

  devise_for :admins, :skip => :registrations
  devise_scope :admin do
    resource :registration,
    :only => [:new, :create, :edit, :update],
    :path => 'admins',
    :path_names => { :new => 'sign_up' },
    :controller => 'devise/registrations',
    :as => :admin_registration do
      get :cancel
    end
  end
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action
  root :to => 'portal#home'
  get 'home' => 'portal#home'
  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  get 'adminco' => 'portal#admin', :as => "admin_panel"
  
  get 'admins/list' => 'admin#list', :as => "admin_list"
  get 'admins/profil' => 'admin#show', :as => 'adminprofil'

  get 'users/list' => 'user#list', :as => "user_list"
  get 'users/:id' => 'user#show', :as => 'user'
  get 'user/profil' => 'user#usprofil', :as => 'userprofil'

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
