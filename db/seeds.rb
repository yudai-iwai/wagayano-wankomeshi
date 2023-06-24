# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Admin用のデータ
Admin.create!(
  [
    {email: "admin@co.jp", password: "wankomeshi", password_confirmation: "wankomeshi"}
  ]
)

# memberのテストデータ
Member.create!(
  [
    {name: "佐藤　花子", email: "hanako@co.jp", password: "password", password_confirmation: "password", dog_name: "かつお", dog_breed: "柴犬", dog_age: "2", dog_gender: "オス", is_deleted: "false", image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")},
    {name: "鈴木　隆", email: "takashi@co.jp", password: "password", password_confirmation: "password", dog_name: "ホッケ", dog_breed: "シェパード", dog_age: "1", dog_gender: "オス", is_deleted: "false", image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg")},
    {name: "中田　英俊", email: "nakata@co.jp", password: "password", password_confirmation: "password", dog_name: "ディエゴ", dog_breed: "ポメラニアン", dog_age: "5", dog_gender: "メス", is_deleted: "false", image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg")},
    {name: "高橋　剛", email: "tsuyoshi@co.jp", password: "password", password_confirmation: "password", dog_name: "チャコ", dog_breed: "シーズー", dog_age: "9", dog_gender: "メス", is_deleted: "false", image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user4.jpg"), filename:"sample-user4.jpg")},
    {name: "田中　俊介", email: "tanaka@co.jp", password: "password", password_confirmation: "password", dog_name: "ハチ", dog_breed: "柴犬", dog_age: "4", dog_gender: "メス", is_deleted: "false", image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user5.jpg"), filename:"sample-user5.jpg")},
    {name: "タケダ", email: "takeda@co.jp", password: "password", password_confirmation: "password", dog_name: "ボス", dog_breed: "ラブラドール・レトリーバー", dog_age: "2", dog_gender: "メス", is_deleted: "false", image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user6.jpg"), filename:"sample-user6.jpg")},
    {name: "だいゆー", email: "daiyu@co.jp", password: "password", password_confirmation: "password", dog_name: "大福", dog_breed: "セント・バーナード", dog_age: "3", dog_gender: "オス", is_deleted: "false", image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user7.jpg"), filename:"sample-user7.jpg")},
    {name: "小笠原", email: "oga@co.jp", password: "password", password_confirmation: "password", dog_name: "ジーコ", dog_breed: "チャウチャウ", dog_age: "2", dog_gender: "オス", is_deleted: "false", image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user8.jpg"), filename:"sample-user8.jpg")},
    {name: "佐藤　かける", email: "kakeru@co.jp", password: "password", password_confirmation: "password", dog_name: "ワシントン", dog_breed: "ピットブル", dog_age: "1", dog_gender: "オス", is_deleted: "false", image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user9.jpg"), filename:"sample-user9.jpg")},
    {name: "犬マニア", email: "mania@co.jp", password: "password", password_confirmation: "password", dog_name: "チョコ", dog_breed: "コーギー", dog_age: "7", dog_gender: "メス", is_deleted: "false", image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user10.jpg"), filename:"sample-user10.jpg")},
    {name: "レッズ", email: "reds@co.jp", password: "password", password_confirmation: "password", dog_name: "ショルツ", dog_breed: "ブルドック", dog_age: "2", dog_gender: "オス", is_deleted: "false", image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user11.jpg"), filename:"sample-user11.jpg")}
  ]
)

# タグのデータ
Tag.create!(
  [
    { name: '超小型犬（4kg未満）'},{ name: '小型犬（10kg未満）'},{ name: '中型犬(25kg未満)'},{ name: '大型犬(25kg以上)'},{ name: '超大型犬（40kg以上）'},{ name: 'パピー犬'},{ name: 'シニア犬'},{ name: 'アジリティ犬'}
  ]
)