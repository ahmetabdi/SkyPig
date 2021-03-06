SkyPig::Application.routes.draw do

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users
  resources :users
  #movieapi
  resources :movies
  resources :collections
  resources :person
  resources :company
  resources :games
  resources :discussions

  devise_for :users, :controllers => {:sessions => 'devise/sessions', :registrations => 'devise/registrations', :passwords => 'devise/passwords'}, :skip => [:sessions] do
    get '/login' => 'devise/sessions#new', :as => :new_user_session
    post '/login' => 'devise/sessions#create', :as => :user_session
    get '/logout' => 'devise/sessions#destroy', :as => :destroy_user_session
    get "/register" => "devise/registrations#new", :as => :new_user_registration
  end

  match 'users' => "users#index"

  match 'results' => "results#index"
  match 'game' => "results#show"
  match 'wiki_search' => "stiki::pages#search"
  get "search/index"
  match 'search' => "search#index"
  #match 'movie' => "movies#index"
  #match 'movie_results' => "movies#show"

  
  resources :authors, :controller => 'stiki::authors'
  
  resources :spaces, :controller => 'stiki::spaces' do
    resources :pages, :controller => 'stiki::pages'    
  end

  #root :to => 'home#index'
  root :to => 'stiki/spaces#index'
  mount Stiki::Engine => "/wiki"
  
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
