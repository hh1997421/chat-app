class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
# 空の場合はDBに保存しないというバリデーション
  validates :content, presence: true
end
