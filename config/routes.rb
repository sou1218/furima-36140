Rails.application.routes.draw do
  get 'credit/new'
  devise_for :users
  root to: "buy_items#index"

  resources :buy_items, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :orders, only: [:index, :create]
  end

  resources :credits, only: [:new, :create]
end
