Rails.application.routes.draw do
  devise_for :users
  root to: "buy_items#index"

  resources :buy_items do
    resources :orders, only: [:index, :create]
  end

end
