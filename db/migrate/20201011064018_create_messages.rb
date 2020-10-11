class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      # foreign_key: trueの制約をつけましょう。こちらの制約をつけることにより、外部キー（今回であればroom_idとuser_id）がないとDBに保存できないようにする
      t.string :content
      t.references :user, foreign_key: true
      t.references :room, foreign_key: true
      t.timestamps
    end
  end
end
