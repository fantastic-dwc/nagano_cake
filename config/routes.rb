Rails.application.routes.draw do

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
  resources :customers, only:[:show,:edit,:update] do
    get "/customers/unsubscribe" => "public/customers#unsubscribe", as: "unsubscribe"
    patch "/customers/withdrawal" => "public/customers#withdrawal", as: "withdrawal"
  end
  resources :cart_products, only:[:index,:create,:update,:destroy] do
    delete "/cart_products/destroy_all" => "public/cart_products#destroy_all", as: "destroy_all"
  end
  resources :orders, only:[:index,:show,:new,:create], controller: "public/orders" do
    post "/orders/confirm" => "public/orders#confirm", as: "confirm"
    get "/orders/complete" => "public/orders#complete", as: "complete"
  end
  resources :shipping_addresses, only:[:index,:edit,:create,:update,:destroy]
  
  namespace :admin do
    resources :products, only:[:index,:new,:show,:edit,:create,:update]
    resources :genres, only:[:index,:edit,:create,:update]
    resources :customers, only:[:index,:show,:edit,:update]
    resources :orders, only:[:show,:update]
    resources :order_products, only:[:update] 
    get "/admin" => "admin/homes#top", as: "admin"
  end
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
