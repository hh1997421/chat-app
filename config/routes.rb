Rails.application.routes.draw do
  get 'messages/index'
  # ビュー実装のための仮ルーティング
  root to: "messages#index"
end
