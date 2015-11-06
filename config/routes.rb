Rails.application.routes.draw do


  resources :foods
  root to: "foods#index"

  resources :comments

end
