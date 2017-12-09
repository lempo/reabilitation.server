Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'welcome/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  # Example of regular route:
  get 'reabilitation/api/loginspec/' => 'api#loginspec'
  get 'reabilitation/api/loginpatient/' => 'api#loginpatient'
  get 'reabilitation/api/listpatients/' => 'api#listpatients'
  get 'reabilitation/api/newpatient/' => 'api#newpatient'
  get 'reabilitation/api/deletepatient/' => 'api#deletepatient'
  get 'reabilitation/api/addresult/' => 'api#addresult'
  get 'reabilitation/api/findresults/' => 'api#findresults'
  get 'reabilitation/api/findtaskgroup/' => 'api#findtaskgroup'
  get 'reabilitation/api/groupexists/' => 'api#groupexists'
  get 'reabilitation/api/taskexists/' => 'api#taskexists'
  get 'reabilitation/api/addtask/' => 'api#addtask'
  get 'reabilitation/api/addgroup/' => 'api#addgroup'
  get 'reabilitation/api/findtaskname/' => 'api#findtaskname'
  get 'reabilitation/api/editpatient/' => 'api#editpatient'
  get 'reabilitation/api/newspec/' => 'api#newspec'
  get 'reabilitation/api/checkkey/' => 'api#checkkey'
  get 'reabilitation/api/registerkey/' => 'api#registerkey'
  get 'reabilitation/api/getversion/' => 'api#getversion'
  get 'reabilitation/api/addversion/' => 'api#addversion'
  get 'reabilitation/api/getdays/' => 'api#getdays'
  get 'reabilitation/api/addlicence/' => 'api#addlicence'
  get 'reabilitation/api/getfrom/' => 'api#getfrom'

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
