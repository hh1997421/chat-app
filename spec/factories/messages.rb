FactoryBot.define do
  factory :message do
    content {Faker::Lorem.sentence}
    association :user
    association :room
# after(:build) とすることで、インスタンスがbuildされた後に指定の処理を実行
    after(:build) do |item|
      # io: File.openでに設定したパスのファイル（public/images/test_image.png）を、test_image.pngというファイル名で保存
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end