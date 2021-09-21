Rails.application.routes.draw do

  namespace :admins do #管理者側のルーティング

    root to: 'homes#top'

    resources :customers, only:[:index,:show,:edit,:update]

    resources :geners, only:[:index,:create,:edit,:update]

    resources :orders, only:[:show,:update,:index]

    resources :items, only:[:index,:new,:create,:show,:edit,:update]

    resources :order_items, only:[:update]

  end

  root to: 'homes#top' #会員側のルーティング

  get 'home/about', to: 'homes#about'

  resource :customers, only:[:show,:edit,:update,:confirm,:withdraw]

  resources :items, only:[:index,:show]

  resources :cart_items, only:[:index,:update,:destroy,:empty,:create]

  resources :orders, only:[:new,:confirm,:create,:index,:show,:complete]

  resources :addresses, only:[:index,:create,:edit,:update,:destroy]

  devise_for :views
  devise_for :customers
  devise_for :admins

end
