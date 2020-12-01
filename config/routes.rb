# routes is about user action
Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :shops do
    resources :product, shallow: true, except: [:dashboard]
  end

  resources :carts do
      resources :product_selection

  # make method called dashboard
  # need a view dashboard.html.erb
  get "/dashboard", to: "bookings#dashboard"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  resources :shops do
    # so that we have nested URLs, use shallow nesting for certain things
    resources :ratings,only: [ :index, :new, :create ], shallow: true
    end
    resources :comments, only: [ :show, :edit, :update, :destroy ]


  resources :products, except: [:index]

  resources :carts, only: [:show, :new] do
    post '/:product_id', to: 'cart#add_item_to_cart'
    delete '/:product_id', to: 'cart#remove_item_from_cart'
  end
  # method run before_action will create for us

  get '/dashboard', to: 'product#index'

end
