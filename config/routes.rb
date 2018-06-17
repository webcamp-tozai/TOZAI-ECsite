Rails.application.routes.draw do
  get 'artists/create'

  get 'artists/new'

  get 'artists/edit'

  get 'artists/update'

  get 'tracks/create'

  get 'tracks/new'

  get 'tracks/edit'

  get 'tracks/update'

  get 'genres/create'

  get 'genres/new'

  get 'genres/edit'

  get 'genres/update'

  get 'labels/create'

  get 'labels/new'

  get 'labels/edit'

  get 'labels/update'

  get 'disk_numbers/create'

  get 'disk_numbers/new'

  get 'disk_numbers/edit'

  get 'disk_numbers/update'

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
    resources :artists, only: [:create, :new, :edit, :update]
    resources :disc_numbers, only: [:create, :new, :edit, :update]
    resources :tracks, only: [:create, :new, :edit, :update]
    resources :labels, only: [:create, :new, :edit, :update]
    resources :genres, only: [:create, :new, :edit, :update]
  end

  resources :admins, except: [:destroy]

  resources :users, except: [:destroy] do
    resource :cart_items, only: [:create, :new, :edit, :update, :destroy]
  end

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
