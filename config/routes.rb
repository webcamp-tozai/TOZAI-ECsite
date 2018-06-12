Rails.application.routes.draw do













  	resource:item_reviews,only:[:index,:create,:new,:edit,:update,:destroy]
  end
end
