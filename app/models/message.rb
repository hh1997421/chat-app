class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
  # 各レコードとファイルを1対1の関係で紐づけるメソッド
  has_one_attached :image
# 空の場合はDBに保存しないというバリデーション
# validatesのunlessオプションにメソッド名を指定することで、「メソッドの返り値がfalseならばバリデーションによる検証を行う」という条件を作っています。
  validates :content, presence: true, unless: :was_attached?

  # 指定されたwas_attached?メソッドは、self.image.attached?という記述によって、画像があればtrue、なければfalseを返す仕組みです。
  def was_attached?
    self.image.attached?
  end
end
