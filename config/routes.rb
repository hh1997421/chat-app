Rails.application.routes.draw do
  devise_for :users
  # ビュー実装のためのrooms/index.html.erbルーティング
  root to: "rooms#index"
  resources :users, only: [:edit, :update]
  resources :rooms, only: [:new, :create] do
    resources :messages, only: [:index, :create]
 end
end
