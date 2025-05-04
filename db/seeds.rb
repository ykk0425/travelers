# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#ユーザ情報
taro = User.find_or_create_by!(email: "taro@example.com") do |user|
  user.name = "旅好太郎"
  user.password = "tabitaro"
  user.profile_image.attach(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename: "sample-user1.jpg")
end

mama = User.find_or_create_by!(email: "mama@example.com") do |user|
  user.name = "旅行好きママ"
  user.password = "tabimama"
  user.profile_image.attach(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename: "sample-user2.jpg")
end

couple = User.find_or_create_by!(email: "couple@example.com") do |user|
  user.name = "旅するカップル"
  user.password = "tabicouple"
  user.profile_image.attach(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename: "sample-user3.jpg")
end

#旅好太郎さん投稿プラン
#  プラン１
Plan.find_or_create_by!(title: "伊勢神宮お参り記録") do |plan|
  plan.start_date = Date.new(2023,11,3)
  plan.end_date = Date.new(2023,11,3)
  plan.body = "伊勢神宮へ"
  plan.user = taro

  # スポット1（二見浦）
  spot1 = plan.spots.build(
    name: "二見興玉神社(夫婦岩）",
    explanation: "海に浮かぶ2つの岩が有名なパワースポット。",
    visit_order: 1,
    longitude:136.802183,
    latitude: 34.303247,
    staying_start: DateTime.new(2023,11,3,9,30),
    staying_end:   DateTime.new(2023,11,3,10,10)
  )

  spot1.images.attach([
   { io: File.open(Rails.root.join("db/fixtures/sample-spot1-1.jpg")), filename: "sample-spot1-1.jpg" },
   { io: File.open(Rails.root.join("db/fixtures/sample-spot1-2.jpg")), filename: "sample-spot1-2.jpg" },
   { io: File.open(Rails.root.join("db/fixtures/sample-spot1-3.jpg")), filename: "sample-spot1-3.jpg" }
  ])

  #スポット2 (外宮)
  spot2 = plan.spots.build(
    name: "伊勢神宮 外宮",
    explanation: "日本一有名な神社のひとつ。正式参拝ルートなぞって外宮から。",
    visit_order: 2,
    longitude: 136.703579,
    latitude: 34.487471,
    staying_start: DateTime.new(2023,11,3,11,0),
    staying_end:   DateTime.new(2023,11,3,12,0)
  )
 
  #スポット3 (おかげ横丁)
  spot3 = plan.spots.build(
    name: "おかげ横丁",
    explanation: "江戸時代の町並みを再現した観光スポット！ここで昼食とお土産探し！",
    visit_order: 3,
    longitude: 136.722823,
    latitude: 34.462801,
    staying_start: DateTime.new(2023,11,3,12,30),
    staying_end:   DateTime.new(2023,11,3,14,30)
  )
  spot3.images.attach([
   { io: File.open(Rails.root.join("db/fixtures/sample-spot3.jpg")), filename: "sample-spot3.jpg" }
  ])
  
  #スポット4 (内宮)
  spot4 = plan.spots.build(
    name: "伊勢神宮 内宮",
    explanation: "日本一有名な神社のひとつ。",
    visit_order: 4,
    longitude: 136.726020,
    latitude: 34.459319,
    staying_start: DateTime.new(2023,11,3,14,45),
    staying_end:   DateTime.new(2023,11,3,16,00)
  )
  spot4.images.attach([
   { io: File.open(Rails.root.join("db/fixtures/sample-spot4.jpg")), filename: "sample-spot4.jpg" }
  ])

  # spot1 にルートをネスト（鳥羽駅→二見浦 ）
  spot1.routes.build(
    departure: "鳥羽駅",
    arrival: "夫婦岩東口(三重交通バス)",
    travel_time: 12,
    transportation: 2, # バス
    description: "伊勢市駅からバスだと45分くらいかかる(便によっては？)みたいだったので鳥羽駅からバスで移動",
    visit_order: 1
  )

  # spot2 にルートをネスト（二見浦 → 伊勢神宮外宮）
  spot2.routes.build(
    departure: "夫婦岩東口",
    arrival: "外宮前",
    travel_time: 45,
    transportation: 2, #  バス
    description: nil,
    visit_order: 2
  )
  # spot3 にルートをネスト（伊勢神宮外宮→おかげ横丁）
  spot3.routes.build(
    departure: "外宮前",
    arrival:"神宮会館前" ,
    travel_time: 20,
    transportation: 2, # バス
    description: nil,
    visit_order: 3
  )
  # spot4 にルートをネスト（おかげ横丁 → 伊勢神宮内宮）
  spot4.routes.build(
    departure: "おかげ横丁",
    arrival: "内宮",
    travel_time: 15,
    transportation: 0, # 徒歩
    description: "おかげ横丁ぶらぶらして内宮へ",
    visit_order: 4
  )
end


#旅好きママさん投稿プラン
#プラン1
Plan.find_or_create_by!(title: "三重旅行") do |plan|
  plan.start_date = Date.new(2024, 8, 1)
  plan.end_date = Date.new(2024, 8, 3)
  plan.body = "子どもと一緒に夏休みの旅行に行きました♫"
  plan.user = mama


  spot1 = plan.spots.build(
    name: "伊勢シーパラダイス",
    explanation: "距離感がすごく近い水族館！ふれあいの多さに子どもも大喜び！じっくり回って大満足です！",
    visit_order: 1,
    longitude: 136.803720,
    latitude: 34.313526,
    staying_start: DateTime.new(2024,8,1,12,0),
    staying_end:   DateTime.new(2025,8,1,15,0)
  )

  spot1.images.attach([
    { io: File.open(Rails.root.join("db/fixtures/mama-p1-spot1-1.jpg")), filename: "mama-p1-spot1-1.jpg" },
    { io: File.open(Rails.root.join("db/fixtures/mama-p1-spot1-2.jpg")), filename: "mama-p1-spot1-2.jpg" },    
   ])

  # スポット2(宿泊)
  spot2 = plan.spots.build(
    name: "ホテル志摩スペイン村",
    explanation: "志摩スペイン村”公式ホテルに宿泊！",
    visit_order: 2,
    longitude: 136.7525,
    latitude: 34.4836,
    staying_start: DateTime.new(2024,8,1,17,0),
    staying_end:   DateTime.new(2024,8,3,10,0)
  )

  # スポット3（志摩スペイン村）
  spot3 = plan.spots.build(
    name: "志摩スペイン村",
    explanation: "一日中志摩スペイン村を堪能！アトラクションもたくさん乗って楽しかったみたい！",
    visit_order: 3,
    longitude: 136.845004,
    latitude: 34.360693,
    staying_start: DateTime.new(2024,8,2,9,0),
    staying_end:   DateTime.new(2024,8,2,20,0)
  )

  spot3.images.attach([
    { io: File.open(Rails.root.join("db/fixtures/mama-p1-spot3-1.jpg")), filename: "mama-p1-spot3-1.jpg" },
    { io: File.open(Rails.root.join("db/fixtures/mama-p1-spot3-2.jpg")), filename: "mama-p1-spot3-2.jpg" },
    { io: File.open(Rails.root.join("db/fixtures/mama-p1-spot3-3.jpg")), filename: "mama-p1-spot3-3.jpg" }    
   ])


  # スポット4（鳥羽湾クルーズ）
  spot4 = plan.spots.build(
    name: "鳥羽湾めぐりとイルカ島",
    explanation: "普段のることのない大きい船に乗ってイルカのいる島へ！",
    visit_order: 4,
    longitude: 136.844946,
    latitude: 34.49007,
    staying_start: DateTime.new(2024,8,3,10,0),
    staying_end:   DateTime.new(2024,8,3,12,0)
  )

  # スポット5（鳥羽水族館）
  spot5 = plan.spots.build(
    name: "鳥羽水族館",
    explanation: "ジュゴンに会える水族館！",
    visit_order: 5,
    longitude: 136.8460367,
    latitude: 34.4812397,
    staying_start: DateTime.new(2024,8,3,13,10),
    staying_end:   DateTime.new(2024,8,3,16,00)
  )

  spot5.images.attach([
    { io: File.open(Rails.root.join("db/fixtures/mama-p1-spot5-1.jpg")), filename: "mama-p1-spot5-1.jpg" },
    { io: File.open(Rails.root.join("db/fixtures/mama-p1-spot5-2.jpg")), filename: "mama-p1-spot5-2.jpg" },
    { io: File.open(Rails.root.join("db/fixtures/mama-p1-spot5-3.jpg")), filename: "mama-p1-spot5-3.jpg" }    
   ])

  # spot1 にルートをネスト（鳥羽駅 → 伊勢シーパラダイス）
  spot1.routes.build(
    departure: "鳥羽駅",
    arrival: "夫婦岩東口",
    travel_time: 15,
    transportation: 2, #バス
    description: nil,
    visit_order: 1
  )

  # spot2 にルートをネスト（ 伊勢シーパラダイス→鳥羽駅）
  spot2.routes.build(
    departure: "夫婦岩東口",
    arrival: "鳥羽駅",
    travel_time: 15,
    transportation: 2, # バス
    description: nil,
    visit_order: 2
  )
  # spot2（ 鳥羽駅→鵜方駅）
  spot2.routes.build(
    departure: "鳥羽駅",
    arrival: "鵜方駅",
    travel_time: 25,
    transportation: 1, # 電車
    description: nil,
    visit_order: 3
  )
  # spot2（ 鵜方駅→ホテル）
  spot2.routes.build(
    departure: "鵜方駅",
    arrival: "ホテル志摩スペイン村",
    travel_time: 10,
    transportation: 2, # バス
    description: nil,
    visit_order: 4
  )

  # spot4 にルートをネスト（ホテル志摩スペイン村→鵜方駅）
  spot4.routes.build(
    departure: "ホテル志摩スペイン村",
    arrival: "鵜方駅",
    travel_time: 10,
    transportation: 2, # たとえば 3 = バス
    description: nil,
    visit_order: 5
  )
  # spot4 にルートをネスト（鵜方駅→鳥羽駅）
  spot4.routes.build(
    departure: "鵜方駅",
    arrival: "鳥羽駅",
    travel_time: 15,
    transportation: 1, #電車
    description: nil,
    visit_order: 6
  )
  spot4.routes.build(
    departure: "鳥羽駅",
    arrival: "鳥羽マリンターミナル",
    travel_time: 10,
    transportation: 0, #徒歩
    description: nil,
    visit_order: 7
  )
  # spot5にルートをネスト（真珠島・水族館のりば→鳥羽水族館）
  spot5.routes.build(
    departure: "真珠島・水族館のりば",
    arrival: "鳥羽水族館",
    travel_time: 1,
    transportation: 0, #徒歩
    description: nil,
    visit_order: 8
  )

end