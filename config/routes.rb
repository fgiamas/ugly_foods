# routes is about user action
Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  # make method called dashboard
  # need a view dashboard.html.erb
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  resources :shops do
    # so that we have nested URLs, use shallow nesting for certain things
    resources :ratings, shallow: true
  end


  resources :products, except: [:index]

  resources :carts, only: [:show, :new] do
    post '/:product_id', to: 'cart#add_item_to_cart'
    delete '/:product_id', to: 'cart#remove_item_from_cart'
  end
  # method run before_action will create for us

  get '/dashboard', to: 'products#dashboard'

end
