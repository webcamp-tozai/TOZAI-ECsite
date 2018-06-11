Rails.application.routes.draw do
  resources :items, except: [:destroy]
end
