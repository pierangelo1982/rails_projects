Rails.application.routes.draw do
  resources :vehicle_card_acceptances
  resources :employees
  resources :processing_cards
  #resources :products
  resources :product_categories
  resources :suppliers
  resources :brands
  resources :payment_deadlines
  resources :purchase_payment_deadlines
  #resources :invoices
  #resources :purchase_invoices
  resources :payment_methods
  resources :taxes
  resources :address_books
  get 'dashboard/index'
  get 'dashboard/magazzino'

  root 'dashboard#index'

  resources :invoices do
     member do
       get :paid_status
       put :paid_status
    end
    member do
      get 'fattura'
    end
  end

  resources :purchase_invoices do
     member do
       get :paid_status
       put :paid_status
    end
  end

  resources :products do
    collection do
      post :edit_qt
    end
    member do
      get :update_qt
      put :update_qt
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
