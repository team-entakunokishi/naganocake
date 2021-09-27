Rails.application.routes.draw do



  devise_for :customers,  controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions",
    passwords: "public/passwords"
  }

  devise_for :admins, only: [:sessions], :controllers => {
    :sessions => 'admins/sessions'
  }


  namespace :admins do #管理者側のルーティング

    root to: 'homes#top'

    resources :customers, only:[:index,:show,:edit,:update]

    resources :genres, only:[:index,:create,:edit,:update]


    resources :orders, only:[:show,:update,:index]


    resources :items, only:[:index,:new,:create,:show,:edit,:update]

    resources :items_orders, only:[:update]

     get "orders/current_user_order/:id" => "orders#current_user_order"
  end


  #ここから先会員側のルーティング

  root to: 'homes#top'

  get 'home/about', to: 'homes#about'

  get 'public/confirm', to: 'public/customers#confirm'

  put 'public/withdraw', to: 'public/customers#withdraw'

  namespace :public do


  resource :customers, only:[:show,:edit,:update,:confirm,:withdraw]

  resources :items, only:[:index,:show]

  resources :cart_items, only:[:index,:update,:destroy,:empty,:create]


 get "orders/complete" => "orders#complete"
 post "orders/confilm" => "orders#confilm"
  resources :orders, only:[:new,:create,:index,:show]

  resources :addresses, only:[:index,:create,:edit,:update,:destroy]
 delete "cart_items" => "cart_items#empty"
 end



end
