Rails.application.routes.draw do
  
  devise_for :admin, controllers: {
    registrations: "admins/registrations",
    sessions: "admins/sessions",
    passwords: "admins/passwords",
    confirmations: "admins/confirmations"
  }
  devise_for :user, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions",
    passwords: "users/passwords",
    confirmations: "users/confirmations"
  }
  
  root to: 'homes#top'
  get 'about' => 'homes#about'
  
  namespace :admin do
    patch 'users/out' => 'users#out'
    resources :posts, only: [:index, :show, :destroy, :update]
    resources :users, only: [:show, :update]
  end
  
  scope module: :user do
    get 'users/confirm' => 'users#confirm', as: 'confirm'
    patch 'users/out' => 'users#out', as: 'out'
    resources :users, only: [:index, :show, :edit, :update] 
    resources :post_comments, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]
    resources :pets, only: [:index, :show, :edit, :update, :destroy] 
    resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
