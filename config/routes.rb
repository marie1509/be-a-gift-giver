Rails.application.routes.draw do
  resources :sessions, only: [:index, :new, :create, :destroy]
  resources :icons, only: [:new, :create, :edit, :update, :destroy]

  resources :letsbuys, only: [:new, :create] do
    collection do
      post :confirm
    end
  end


  resources :items do
    resources :willbuys, only: [:create, :destroy]
    resources :didbuys, only: [:create, :destroy]
  end

  resources :users
end
