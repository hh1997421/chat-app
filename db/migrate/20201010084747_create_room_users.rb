class CreateRoomUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :room_users do |t|
      # Railsで外部キーのカラムを追加する際に、用いる型
      # どのテーブルの参照する役割を果たすのが「foreign_key: true」
      t.references :room, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
