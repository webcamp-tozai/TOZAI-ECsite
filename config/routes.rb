Rails.application.routes.draw do
  get 'admins/top'

  get 'admins/index'

  get 'admins/show'

  get 'admins/edit'

  get 'admins/update'

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

  resources :items, except: [:destroy] do
  	resource :item_reviews,only:[:index,:create,:new,:edit,:update,:destroy]
  end
end
