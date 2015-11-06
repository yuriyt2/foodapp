Rails.application.routes.draw do

  root to: "users#index"

  resources :foods do
    resources :comments
  end



  resources :users, only: [:new, :create, :index]



  get "users/profile" => "users#profile"

  post "/sessions" => "sessions#create"
  delete "/sessions" => "sessions#destroy"

end
