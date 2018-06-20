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

  delete '/users/:id/cart_items' => 'cart_items#all_destroy', as: 'all_destroy_cart_items'

  resources :addresses, except: [:index, :show]

  resources :orders, except: [:destroy] do
    resource :order_items, only: [:create, :new]
  end
  #支払い画面で表示、選択するためにID無しとID有りのURL生成
  resources :payments, only: [:index, :show]

  resources :contacts, except: [:edit, :update, :destroy] do
    #問い合わせ管理画面で絞り込むためにID無しとID有りのURL生成
    resources :contact_statuses, only: [:index, :show]
  end
end
