# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Admin用のデータ
Admin.create(email: "admin@co.jp", password: "wankomeshi", password_confirmation: "wankomeshi")
# タグのデータ
Tag.create([{ name: '超小型犬（4kg未満）'},{ name: '小型犬（10kg未満）'},{ name: '中型犬(25kg未満)'},{ name: '大型犬(25kg以上)'},{ name: '超大型犬（40kg以上）'},{ name: 'パピー犬'},{ name: 'シニア犬'},{ name: 'アジリティ犬'}])