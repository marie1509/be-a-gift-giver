Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :icons, only: [:new, :create, :edit, :update, :destroy]
  
  resources :items do
    resources :willbuys, only: [:create, :destroy]
  end

  resources :users
end
