Rails.application.routes.draw do
  devise_for :users
  get 'messages/index'
  # ビュー実装のための仮ルーティング
  root to: "messages#index"
  resources :users, only: [:edit, :update]
end
