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
end
