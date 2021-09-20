Rails.application.routes.draw do

  devise_for :customers,  controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions",
    passwords: "public/passwords"
  }
  devise_for :admins

  namespace :admins do #管理者側のルーティング

    root to: 'homes#top'

    resources :customers, only:[:index,:show,:edit,:update]

    resources :geners, only:[:index,:create,:edit,:update]

    resources :orders, only:[:show,:update,:index]

    resources :items, only:[:index,:new,:create,:show,:edit,:update]

    resources :order_items, only:[:update]

  end
  
  #ここから先会員側のルーティング
  
  root to: 'homes#top'

  get 'home/about', to: 'homes#about'
  
  namespace :public do 

  resource :customers, only:[:show,:edit,:update,:confirm,:withdraw]

  resources :items, only:[:index,:show]

  resources :cart_items, only:[:index,:update,:destroy,:empty,:create]

  resources :orders, only:[:new,:confirm,:create,:index,:show,:complete]

  resources :addresses, only:[:index,:create,:edit,:update,:destroy]
  
 end

end
