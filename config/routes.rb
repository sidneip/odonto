# -*- encoding : utf-8 -*-
Odonto::Application.routes.draw do
  resources :consulta_procedimentos

  resources :clinicas
  resources :sessions do
    post 'create',  :on => :collection
    get  'dentista', :on => :collection
    post 'create_dentista', :on => :collection
  end
  resources :descritivo_faturas

  resources :faturas do
    get 'adicionar_procedimento', :on => :collection
  end

  resources :consultas do
    get 'calendario', :on => :collection
    get 'confirmar_consulta'
    get 'calendario_dentista', :on => :collection
  end
  root to: 'static#index'

  resources :dentistas
  
  resources :procedimentos

  resources :convenios

  resources :pacientes

  get "/registrar", :controller => "clinicas", :action=>"new"
  get "/login", :controller => "sessions", :action=>"new"

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
