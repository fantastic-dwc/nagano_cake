Rails.application.routes.draw do

  get "search" => "public/searches#search"
  get "/customers/my_page" => "public/customers#show", as: "my_page"
  get "/customers/edit" => "public/customers#edit", as: "edit_customers"
  patch "customers" => "public/customers#update"
  get "/customers/unsubscribe" => "public/customers#unsubscribe", as: "unsubscribe"
  patch "/customers/withdrawal" => "public/customers#withdrawal", as: "withdrawal"
 
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  root to: "public/homes#top"
  get "/about" => "public/homes#about", as: "about"
  resources :products, only:[:index,:show], controller: "public/products"

  resources :cart_products, only:[:index,:create,:update,:destroy], controller: "public/cart_products" do
    delete "/cart_products/destroy_all" => "public/cart_products#destroy_all", as: "destroy_all"
  end

  post "/orders/confirm" => "public/orders#confirm", as: "confirm"
  get "/orders/complete" => "public/orders#complete", as: "complete"
  resources :orders, only:[:index,:show,:new,:create], controller: "public/orders" do
  end

  resources :shipping_addresses, only:[:index,:edit,:create,:update,:destroy], controller: "public/shipping_addresses"

  namespace :admin do
    resources :products, only:[:index,:new,:show,:edit,:create,:update]
    resources :genres, only:[:index,:edit,:create,:update,:destroy]
    resources :customers, only:[:index,:show,:edit,:update]
    resources :orders, only:[:show,:update]
    resources :order_products, only:[:update]
  end

  get "/admin" => "admin/homes#top", as: "admin"

    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
