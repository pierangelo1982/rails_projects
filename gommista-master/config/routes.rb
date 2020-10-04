Gommista::Application.routes.draw do


  devise_for :users
  resources :scriviworks

  get "meccanica/index"
  resources :catextraworks

  resources :extralavoroworks

  resources :extraworks do
    member do
      get 'stampaextrawork'
    end
  end


  resources :locations

  resources :worktypes

  resources :works

  resources :worktypologies

  resources :columns

  resources :floors

  resources :blocks

  resources :shelves

  resources :tyres do
    member do
       get :submitdeposito
       put :submitdeposito
      end 
     member do
       get :submitinstallation
       put :submitinstallation
      end 
      member do
       get :submitusurata
       put :submitusurata
      end 
      member do
       get :submitusuratariattiva
       put :submitusuratariattiva
      end 
    end  

  resources :cars do
    member do
      get 'pdf'
    end
     member do
      get 'barcode'
    end
    member do
      get 'stampatarga'
    end
    member do
      get 'stampagomme'
    end
    member do
      get 'stampamagazzino'
    end
  end

  resources :owners

  get "welcome/index"
  get "welcome/hello"
  get "welcome/delete"
  get "welcome/resettarga"


  get "meccanica/index"
  get "meccanica/hello"
  get "meccnica/delete"
  get "meccanica/resettarga"

  get ':controller/:action.:format'

  root :controller => 'welcome', :action => :index

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
