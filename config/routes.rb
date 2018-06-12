Rails.application.routes.draw do
  resources :items, except: [:destroy] do
  	resource:item_reviews,only:[:index,:create,:new,:edit,:update,:destroy]
  end
end
