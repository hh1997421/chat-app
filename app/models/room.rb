class Room < ApplicationRecord
  has_many :room_users
  # dependent: :destroyでroom(親モデル)が削除されると、user,message, room_userも削除される
  has_many :users, through: :room_users, dependent: :destroy
  has_many :messages, dependent: :destroy

  validates :name, presence: true
end
  
 