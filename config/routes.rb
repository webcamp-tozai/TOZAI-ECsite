Rails.application.routes.draw do
  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
  }

  devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
  }

  root to: 'items#index'
  get '/admins_top' => 'admins#top', as: 'admins_top'
  get '/genre/:id' => 'items#genre_index', as: 'genre'      # ジャンルの絞り込みページ
  get '/artist/:id' => 'items#artist_index', as: 'artist'   # アーティストでの絞り込みページ

  resources :items, except: [:destroy] do
  	resources :item_reviews, only: [:create, :new, :edit, :update, :destroy, :index]
    resources :tracks, only: [:create, :new, :edit, :update]
    resources :labels, only: [:create, :new, :edit, :update]
    resources :genres, only: [:create, :new, :edit, :update]
    resources :artists, only: [:create, :new, :edit, :update]
    resources :cart_items, only: [:index, :destroy, :all_destroy, :create, :update]
  end

  resources :item_reviews, only: [:index, :destroy]

  resources :genres, only: [:index]
    resources :items, only: [:index]

  resources :artists, only: [:index]
    resources :items, only: [:index]

  resources :admins, except: [:destroy]

  get '/admins/:id/edit_password' => 'admins#edit_password', as: 'admin_edit_password'
  post '/admins/:id' => 'admins#update_status', as: 'update_status_admin'

  resources :users, except: [:destroy] do
    resources :item_reviews, only: [:index, :destroy]
    resources :cart_items, only: [:index, :destroy, :all_destroy, :create, :update]
  end

  get '/users/:id/edit_password' => 'users#edit_password', as: 'user_edit_password'
  #post '/users/:id' => 'users#update_status', as: 'update_status_user'
  get '/users/:id/confirm' => 'users#confirm', as: 'confirm'
  post '/users/:id/confirm' => 'users#unsubscribe', as: 'unsubscribe'

  delete '/users/:id/cart_items' => 'cart_items#all_destroy', as: 'all_destroy_cart_items'

  resources :addresses, except: [:index, :show]

  resources :orders, except: [:destroy] do
    resource :order_items, only: [:create, :new]
  end

  get '/orders_status1' => 'orders#orders_status1', as: 'orders_status1'
  get '/orders_status2' => 'orders#orders_status2', as: 'orders_status2'
  get '/orders_status3' => 'orders#orders_status3', as: 'orders_status3'
  get '/orders_status4' => 'orders#orders_status4', as: 'orders_status4'

  #支払い画面で表示、選択するためにID無しとID有りのURL生成
  resources :payments, only: [:index, :show]

  resources :contacts, except: [:edit, :update, :destroy] do
    #問い合わせ管理画面で絞り込むためにID無しとID有りのURL生成
    resources :contact_statuses, only: [:index, :show]
  end
end
