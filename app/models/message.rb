class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
  # 各レコードとファイルを1対1の関係で紐づけるメソッド
  has_one_attached :image
# 空の場合はDBに保存しないというバリデーション
  validates :content, presence: true
end
