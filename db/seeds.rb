# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#ユーザ情報
taro = User.find_or_create_by!(email: "tabisuki@example.com") do |user|
  user.name = "旅好さん"
  user.password = "tabisuki"
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

honobono = User.find_or_create_by!(email: "honobono@example.com") do |user|
  user.name = "ほのぼのさん"
  user.password = "honobono"
  user.profile_image.attach(io: File.open("#{Rails.root}/db/fixtures/sample-user4.jpg"), filename: "sample-user4.jpg")
end


#旅好さんプラン１
Plan.find_or_create_by!(title: "山口弾丸旅行") do |plan|
  plan.start_date = Date.new(2022,6,16)
  plan.end_date = Date.new(2022,6,16)
  plan.body ="大阪から新門司港までフェリーを利用して初めての日帰りで山口へ！！"
  plan.user = tabisuki
  
  #スポット1（角島大橋）
  spot1 = plan.spots.build(
    name: "角島大橋",
    explanation: "絶景スポットへ！",
    visit_order: 1,
    address: "山口県下関市豊北町大字神田",
    staying_start: DateTime.new(2022,6,16,7,00),
    staying_end:   DateTime.new(2022,6,16,7,30)
  )

  spot1.images.attach([
   { io: File.open(Rails.root.join("db/fixtures/tabisuki-p1-spot1-1.jpg")), filename: "tabisuki-p1-spot1-1.jpg" }
  ])

  #スポット2（角島灯台）
  spot2 = plan.spots.build(
    name: "角島灯台",
    explanation: "nil",
    visit_order: 2,
    address: "山口県下関市豊北町大字角島1",
    staying_start: DateTime.new(2022,6,16,7,40),
    staying_end:   DateTime.new(2022,6,16,8,10)
  )

  spot2.images.attach([
   { io: File.open(Rails.root.join("db/fixtures/tabisuki-p1-spot2-1.jpg")), filename: "tabisuki-p1-spot2-1.jpg" },
   { io: File.open(Rails.root.join("db/fixtures/tabisuki-p1-spot2-2.jpg")), filename: "tabisuki-p1-spot2-2.jpg" }
  ])

  #スポット3（元乃隅稲荷神社）
  spot3 = plan.spots.build(
    name: "元乃隅稲荷神社",
    explanation: "123基の赤鳥居が海に向かって並ぶ絶景神社!!入れにくい賽銭箱に挑戦！一発で入りました♫",
    visit_order: 3,
    address: "山口県長門市油谷津黄498",
    staying_start: DateTime.new(2022,6,16,9,00),
    staying_end:   DateTime.new(2022,6,16,10,30)
  )

  spot3.images.attach([
   { io: File.open(Rails.root.join("db/fixtures/tabisuki-p1-spot3-1.jpg")), filename: "tabisuki-p1-spot3-1.jpg" },
   { io: File.open(Rails.root.join("db/fixtures/tabisuki-p1-spot3-2.jpg")), filename: "tabisuki-p1-spot3-2.jpg" },
   { io: File.open(Rails.root.join("db/fixtures/tabisuki-p1-spot3-3.jpg")), filename: "tabisuki-p1-spot3-3.jpg" },
   { io: File.open(Rails.root.join("db/fixtures/tabisuki-p1-spot3-4.jpg")), filename: "tabisuki-p1-spot3-4.jpg" },
   { io: File.open(Rails.root.join("db/fixtures/tabisuki-p1-spot3-5.jpg")), filename: "tabisuki-p1-spot3-5.jpg" }
  ])
  
  #スポット4（ランチ）
  spot4 = plan.spots.build(
    name: "お食事処 花",
    explanation: "nil",
    visit_order: 4,
    address: "山口県長門市三隅下2900-1",
    staying_start: DateTime.new(2022,6,16,11,00),
    staying_end:   DateTime.new(2022,6,16,12,30)
  )

  spot4.images.attach([
   { io: File.open(Rails.root.join("db/fixtures/tabisuki-p1-spot4-1.jpg")), filename: "tabisuki-p1-spot4-1.jpg" }
  ])
  
  #スポット5（秋吉台）
  spot5 = plan.spots.build(
    name: "秋吉台展望台",
    explanation: "特別天然記念物に指定されている日本最大級のカルスト台地",
    visit_order: 5,
    address: "山口県美祢市秋芳町秋吉3506-2",
    staying_start: DateTime.new(2022,6,16,13,10),
    staying_end:   DateTime.new(2022,6,16,14,00)
  )

  spot5.images.attach([
   { io: File.open(Rails.root.join("db/fixtures/tabisuki-p1-spot5-1.jpg")), filename: "tabisuki-p1-spot5-1.jpg" }
  ])

  #スポット6（秋芳洞）
  spot6 = plan.spots.build(
    name: "秋芳洞",
    explanation: "日本最大級の鍾乳洞",
    visit_order: 6,
    address: "山口県美祢市秋芳町秋吉3506-2",
    staying_start: DateTime.new(2022,6,16,14,10),
    staying_end:   DateTime.new(2022,6,16,15,50)
  )

  spot6.images.attach([
   { io: File.open(Rails.root.join("db/fixtures/tabisuki-p1-spot6-1.jpg")), filename: "tabisuki-p1-spot6-1.jpg" },
   { io: File.open(Rails.root.join("db/fixtures/tabisuki-p1-spot6-2.jpg")), filename: "tabisuki-p1-spot6-2.jpg" },
   { io: File.open(Rails.root.join("db/fixtures/tabisuki-p1-spot6-3.jpg")), filename: "tabisuki-p1-spot6-3.jpg" }
  ])

  #spot1にルートをネスト（新門司港→角島大橋）
  spot1.routes.build(
    departure: "新門司港",
    arrival: "角島大橋",
    travel_time: 85,
    transportation: 3, #車
    description: "nil",
    visit_order: 1
  )

  #spot2にルートをネスト（角島大橋→角島灯台）
  spot2.routes.build(
    departure: "角島大橋",
    arrival: "角島灯台",
    travel_time: 6,
    transportation: 3, #車
    description: "nil",
    visit_order: 2
  )

  #spot3にルートをネスト（角島灯台→元乃隅稲荷神社）
  spot3.routes.build(
    departure: "角島大橋",
    arrival: "元乃隅稲荷神社",
    travel_time: 40,
    transportation: 3, #車
    description: "nil",
    visit_order: 3
  )

  #spot4にルートをネスト（元乃隅稲荷神社→お食事処　花）
  spot4.routes.build(
    departure: "元乃隅稲荷神社",
    arrival: "お食事処 花",
    travel_time: 40,
    transportation: 3, #車
    description: "nil",
    visit_order: 4
  )

  #spot5にルートをネスト（お食事処　花→秋吉台展望台）
  spot5.routes.build(
    departure: "お食事処 花",
    arrival: "秋吉大展望台",
    travel_time: 10,
    transportation: 3, #車
    description: "nil",
    visit_order: 5
  )

  #spot6にルートをネスト（秋吉台展望台→秋芳洞）
  spot6.routes.build(
    departure: "秋吉台展望台",
    arrival: "秋芳洞",
    travel_time: 10,
    transportation: 3, #車
    description: "nil",
    visit_order: 6
  )

end


#旅好さんプラン２
Plan.find_or_create_by!(title: "京都神社めぐり") do |plan|
  plan.start_date = Date.new(2023,02,22)
  plan.end_date = Date.new(2023,02,22)
  plan.body = "京都の歴史的な建物が素晴らしかった！"
  plan.user = tabisuki
  
  #スポット1（金閣寺）
  spot1 = plan.spots.build(
    name: "金閣寺",
    explanation: "nil",
    visit_order: 1,
    address: "京都府京都市北区金閣寺町1",
    staying_start: DateTime.new(2023,02,22,10,15),
    staying_end:   DateTime.new(2023,02,22,11,20)
  )

  spot1.images.attach([
   { io: File.open(Rails.root.join("db/fixtures/tabisuki-p2-spot1-1.jpg")), filename: "tabisuki-p2-spot1-1.jpg" },
   { io: File.open(Rails.root.join("db/fixtures/tabisuki-p2-spot1-2.jpg")), filename: "tabisuki-p2-spot1-2.jpg" }
  ])

  #スポット2（BRCAFE）
  spot2 = plan.spots.build(
    name: "BRCAFE",
    explanation: "抹茶パフェ美味しかった！",
    visit_order: 2,
    address: "京都府京都市北区衣笠御所ノ内1-4",
    staying_start: DateTime.new(2023,2,22,11,25),
    staying_end:   DateTime.new(2023,2,22,12,30)
  )

  spot2.images.attach([
   { io: File.open(Rails.root.join("db/fixtures/tabisuki-p2-spot2-1.jpg")), filename: "tabisuki-p2-spot2-1.jpg" },
   { io: File.open(Rails.root.join("db/fixtures/tabisuki-p2-spot2-2.jpg")), filename: "tabisuki-p2-spot2-2.jpg" }
  ])

  #スポット3（仁和寺）
  spot3 = plan.spots.build(
    name: "仁和寺",
    explanation: "空気が澄んだように感じて気持ちよかったです！",
    visit_order: 3,
    address: "京都府京都市右京区御室大内33",
    staying_start: DateTime.new(2023,2,22,12,45),
    staying_end:   DateTime.new(2023,2,22,14,00)
  )

  spot3.images.attach([
   { io: File.open(Rails.root.join("db/fixtures/tabisuki-p2-spot3-1.jpg")), filename: "tabisuki-p2-spot3-1.jpg" },
   { io: File.open(Rails.root.join("db/fixtures/tabisuki-p2-spot3-2.jpg")), filename: "tabisuki-p2-spot3-2.jpg" }
  ])

  #スポット4（晴明神社）
  spot4 = plan.spots.build(
    name: "晴明神社",
    explanation: "厄除け、魔除けのご利益をいただきに、伺いました！",
    visit_order: 4,
    address: "京都府京都市北区金閣寺町1",
    staying_start: DateTime.new(2023,2,22,14,30),
    staying_end:   DateTime.new(2023,2,22,15,15)
  )

  spot4.images.attach([
   { io: File.open(Rails.root.join("db/fixtures/tabisuki-p2-spot4-1.jpg")), filename: "tabisuki-p2-spot4-1.jpg" },
   { io: File.open(Rails.root.join("db/fixtures/tabisuki-p2-spot4-2.jpg")), filename: "tabisuki-p2-spot4-2.jpg" },
   { io: File.open(Rails.root.join("db/fixtures/tabisuki-p2-spot4-3.jpg")), filename: "tabisuki-p2-spot4-3.jpg" }
  ])

  #spot1にルートをネスト（京都駅→金閣寺）
  spot1.routes.buile(
    departure: "京都駅",
    arrival: "金閣寺",
    travel_time: 45,
    transportation: 2, #バス
    description: "京都駅のバス乗り場には行き先の案内の表示が沢山あり、案内してくれる人もいて、聞くとその時の時刻をふまえて、どのバスが目的地に一番早くつくか教えてくださいました！",
    visit_order: 1
  )
  #spot2にルートをネスト（金閣寺→BRCAFE）
  spot2.routes.build(
    departure: "金閣寺",
    arrival: "BRCAFE",
    travel_time: 2,
    transportation: 0, #徒歩
    description: "nil",
    visit_order: 2
  )
  #spot3にルートをネスト（BRCAFE→仁和寺）
  spot3.routes.build(
    departure: "BRCAFE",
    arrival: "仁和寺",
    travel_time: 11,
    transportation: 2, #バス
    description: "nil",
    visit_order: 3
  )
  #spot4にルートをネスト（仁和寺→晴明神社）
  spot4.routes.build(
    departure: "仁和寺",
    arrival: "晴明神社",
    travel_time: 24,
    transportation: 2,#バス
    description: "nil",
    visit_order:4
  )
end


#旅好さんプラン３
Plan.find_or_create_by!(title: "伊勢神宮お参り記録") do |plan|
  plan.start_date = Date.new(2023,11,03)
  plan.end_date = Date.new(2023,11,03)
  plan.body = "伊勢神宮へ"
  plan.user = tabisuki

  # スポット1（二見浦）
  spot1 = plan1.spots.create!(
    name: "二見興玉神社(夫婦岩）",
    explanation: "海に浮かぶ2つの岩が有名なパワースポット。",
    visit_order: 1,
    address: "三重県伊勢市二見町江575",
    staying_start: DateTime.new(2023,11,3,9,30),
    staying_end:   DateTime.new(2023,11,3,10,10)
  )

  spot1.images.attach([
   { io: File.open(Rails.root.join("db/fixtures/tabisuki-p3-spot1-1.jpg")), filename: "tabisuki-p3-spot1-1.jpg" },
   { io: File.open(Rails.root.join("db/fixtures/tabisuki-p3-spot1-2.jpg")), filename: "tabisuki-p3-spot1-2.jpg" },
   { io: File.open(Rails.root.join("db/fixtures/tabisuki-p3-spot1-3.jpg")), filename: "tabisuki-p3-spot1-3.jpg" }
  ])

  #スポット2 (外宮)
  spot2 = plan1.spots.create!(
    name: "伊勢神宮 外宮",
    explanation: "日本一有名な神社のひとつ。正式参拝ルートなぞって外宮から。",
    visit_order: 2,
    address: "三重県伊勢市豊川町279",
    staying_start: DateTime.new(2023,11,3,11,0),
    staying_end:   DateTime.new(2023,11,3,12,0)
  )
 
  #スポット3 (おかげ横丁)
  spot3 = plan1.spots.create!(
    name: "おかげ横丁",
    explanation: "江戸時代の町並みを再現した観光スポット！ここで昼食とお土産探し！",
    visit_order: 3,
    address: "三重県伊勢市宇治中之切町52",
    staying_start: DateTime.new(2023,11,3,12,30),
    staying_end:   DateTime.new(2023,11,3,14,30)
  )
  spot3.images.attach([
   { io: File.open(Rails.root.join("db/fixtures/tabisuki-p3-spot3-1.jpg")), filename: "tabisuki-p3-spot3-1.jpg" }
  ])
  
  #スポット4 (内宮)
  spot4 = plan1.spots.create!(
    name: "伊勢神宮 内宮",
    explanation: "日本一有名な神社のひとつ。",
    visit_order: 4,
    address: "三重県伊勢市宇治館町1",
    staying_start: DateTime.new(2023,11,3,14,45),
    staying_end:   DateTime.new(2023,11,3,16,00)
  )
  spot4.images.attach([
   { io: File.open(Rails.root.join("db/fixtures/tabisuki-p3-spot4-1.jpg")), filename: "tabisuki-p3-spot4-1.jpg" },
  ])

  # spot1 にルートをネスト（鳥羽駅→二見浦 ）
  spot1.routes.create!(
    departure: "鳥羽駅",
    arrival: "夫婦岩東口(三重交通バス)",
    travel_time: 12,
    transportation: 2, # バス
    description: "伊勢市駅からバスだと45分くらいかかる(便によっては？)みたいだったので鳥羽駅からバスで移動",
    visit_order: 1
  )

  # spot2 にルートをネスト（二見浦 → 伊勢神宮外宮）
  spot2.routes.create!(
    departure: "夫婦岩東口",
    arrival: "外宮前",
    travel_time: 45,
    transportation: 2, #  バス
    description: nil,
    visit_order: 2
  )
  # spot3 にルートをネスト（伊勢神宮外宮→おかげ横丁）
  spot3.routes.create!(
    departure: "外宮前",
    arrival:"神宮会館前" ,
    travel_time: 20,
    transportation: 2, # バス
    description: nil,
    visit_order: 3
  )
  # spot4 にルートをネスト（おかげ横丁 → 伊勢神宮内宮）
  spot4.routes.create!(
    departure: "おかげ横丁",
    arrival: "内宮",
    travel_time: 15,
    transportation: 0, # 徒歩
    description: "おかげ横丁ぶらぶらして内宮へ",
    visit_order: 4
  )

#旅好さんプラン４
Plan.find_or_create_by!(title: "初金沢旅行！") do |plan|
  plan.start_date = Date.new(2024,11,1)
  plan.end_date = Date.new(2024,11,2)
  plan.body = "京都の歴史的な建物が素晴らしかった！"
  plan.user = tabisuki
  
  #スポット1（石浦神社）
  spot1 = plan.spots.build(
    name: "石浦神社",
    explanation: "金沢で最も古い神社として知られている石浦神社へ！",
    visit_order: 1,
    address: "石川県金沢市本多町3-1-30",
    staying_start: DateTime.new(2024,11,1,10,50),
    staying_end:   DateTime.new(2024,11,1,11,50)
  )

  spot1.images.attach([
   { io: File.open(Rails.root.join("db/fixtures/tabisuki-p4-spot1-1.jpg")), filename: "tabisuki-p4-spot1-1.jpg" },
   { io: File.open(Rails.root.join("db/fixtures/tabisuki-p4-spot1-2.jpg")), filename: "tabisuki-p4-spot1-2.jpg" }
  ])

  #スポット2（ランチ）
  spot2 = plan.spots.build(
    name: "お食事処堤亭",
    explanation: "金沢料理の治部煮うどん！！",
    visit_order: 2,
    address: "石川県金沢市兼六町1-15",
    staying_start: DateTime.new(2024,11,1,12,00),
    staying_end:   DateTime.new(2024,11,1,13,00)
  )
  
  spot2.images.attach([
   { io: File.open(Rails.root.join("db/fixtures/tabisuki-p4-spot2-1.jpg")), filename: "tabisuki-p4-spot2-1.jpg" }
  ])

  #スポット3（兼六園）
  spot3 = plan.spots.build(
    name: "兼六園",
    explanation: "日本三名園の兼六園へ！",
    visit_order: 3,
    address: "石川県金沢市兼六町1",
    staying_start: DateTime.new(2024,11,1,13,10),
    staying_end:   DateTime.new(2024,11,1,14,30)
  )

  spot3.images.attach([
   { io: File.open(Rails.root.join("db/fixtures/tabisuki-p4-spot3-1.jpg")), filename: "tabisuki-p4-spot3-1.jpg" },
   { io: File.open(Rails.root.join("db/fixtures/tabisuki-p4-spot3-2.jpg")), filename: "tabisuki-p4-spot3-2.jpg" }
  ])

  #スポット4（金澤神社）
  spot4 = plan.spots.build(
    name: "金澤神社",
    explanation: "兼六園に隣接する金澤神社",
    visit_order: 4,
    address: "石川県金沢市兼六町1-3",
    staying_start: DateTime.new(2024,11,1,14,30),
    staying_end:   DateTime.new(2024,11,1,15,00)
  )

  spot4.images.attach([
   { io: File.open(Rails.root.join("db/fixtures/tabisuki-p4-spot4-1.jpg")), filename: "tabisuki-p4-spot4-1.jpg" },
   { io: File.open(Rails.root.join("db/fixtures/tabisuki-p4-spot4-2.jpg")), filename: "tabisuki-p4-spot4-2.jpg" }
  ])

  #スポット5（金沢城公園）
  spot5 = plan.spots.build(
    name: "金沢城公園",
    explanation: "兼六園に隣接する金澤神社",
    visit_order: 5,
    address: "石川県金沢市丸の内1-1",
    staying_start: DateTime.new(2024,11,1,15,15),
    staying_end:   DateTime.new(2024,11,1,16,15)
  )

  spot5.images.attach([
   { io: File.open(Rails.root.join("db/fixtures/tabisuki-p4-spot5-1.jpg")), filename: "tabisuki-p4-spot5-1.jpg" },
   { io: File.open(Rails.root.join("db/fixtures/tabisuki-p4-spot5-2.jpg")), filename: "tabisuki-p4-spot5-2.jpg" },
   { io: File.open(Rails.root.join("db/fixtures/tabisuki-p4-spot5-3.jpg")), filename: "tabisuki-p4-spot5-3.jpg" }
  ])

  #スポット6（尾山神社）
  spot6 = plan.spots.build(
    name: "尾山神社",
    explanation: "静かで落ち着いた雰囲気でステンドグラスが綺麗でした！",
    visit_order: 6,
    address: "石川県金沢市尾山町11-1",
    staying_start: DateTime.new(2024,11,1,16,30),
    staying_end:   DateTime.new(2024,11,1,17,10)
  )

  spot6.images.attach([
   { io: File.open(Rails.root.join("db/fixtures/tabisuki-p4-spot6-1.jpg")), filename: "tabisuki-p4-spot6-1.jpg" },
   { io: File.open(Rails.root.join("db/fixtures/tabisuki-p4-spot6-2.jpg")), filename: "tabisuki-p4-spot6-2.jpg" },
   { io: File.open(Rails.root.join("db/fixtures/tabisuki-p4-spot6-3.jpg")), filename: "tabisuki-p4-spot6-3.jpg" }
  ])

  #スポット7（夜ごはん）
  spot7 = plan.spots.build(
    name: "廻る富山湾すし玉",
    explanation: "金沢駅にあるお寿司屋さんで夜ご飯を食べました！",
    visit_order: 7,
    address: "石川県金沢市木ノ新保町7-1-1金沢駅百番街 あんと西2F",
    staying_start: DateTime.new(2024,11,1,17,30),
    staying_end:   DateTime.new(2024,11,1,18,50)
  )

  spot7.images.attach([
   { io: File.open(Rails.root.join("db/fixtures/tabisuki-p4-spot7-1.jpg")), filename: "tabisuki-p4-spot7-1.jpg" },
   { io: File.open(Rails.root.join("db/fixtures/tabisuki-p4-spot7-2.jpg")), filename: "tabisuki-p4-spot7-2.jpg" },
  ])

  #スポット8（ホテル）
  spot8 = plan.spots.build(
    name: "ホテルマイステイズ金沢キャッスル",
    explanation: "nil",
    visit_order: 8,
    address: "石川県金沢市此花町10-17",
    staying_start: DateTime.new(2024,11,1,19,00),
    staying_end:   DateTime.new(2024,11,2,09,00)
  )

  #スポット9（安江八幡宮）
  spot9 = plan.spots.build(
    name: "安江八幡宮",
    explanation: "だるまについつい惹かれました！",
    visit_order: 9,
    address: "石川県金沢市此花町11-27",
    staying_start: DateTime.new(2024,11,2,09,00),
    staying_end:   DateTime.new(2024,11,2,10,00)
  )

  spot9.images.attach([
   { io: File.open(Rails.root.join("db/fixtures/tabisuki-p4-spot9-1.jpg")), filename: "tabisuki-p4-spot9-1.jpg" },
   { io: File.open(Rails.root.join("db/fixtures/tabisuki-p4-spot9-2.jpg")), filename: "tabisuki-p4-spot9-2.jpg" },
   { io: File.open(Rails.root.join("db/fixtures/tabisuki-p4-spot9-3.jpg")), filename: "tabisuki-p4-spot9-3.jpg" }
  ])

  #スポット10（兎橋神社）
  spot10 = plan.spots.build(
    name: "兎橋神社",
    explanation: "おすわさん！うさぎの御朱印がとっても可愛い！",
    visit_order: 10,
    address: "石川県小松市浜田町イ233",
    staying_start: DateTime.new(2024,11,2,11,10),
    staying_end:   DateTime.new(2024,11,2,12,10)
  )

  spot10.images.attach([
   { io: File.open(Rails.root.join("db/fixtures/tabisuki-p4-spot10-1.jpg")), filename: "tabisuki-p4-spot10-1.jpg" },
   { io: File.open(Rails.root.join("db/fixtures/tabisuki-p4-spot10-2.jpg")), filename: "tabisuki-p4-spot10-2.jpg" },
  ])

  #スポット11（ひがし茶屋街）
  spot11 = plan.spots.build(
    name: "ひがし茶屋街",
    explanation: "ひがし茶屋街を散策し、素心さんで加賀棒茶パフェいただきました！",
    visit_order: 11,
    address: "石川県金沢市東山1-24-1",
    staying_start: DateTime.new(2024,11,2,13,15),
    staying_end:   DateTime.new(2024,11,2,15,15)
  )

  spot11.images.attach([
   { io: File.open(Rails.root.join("db/fixtures/tabisuki-p4-spot11-1.jpg")), filename: "tabisuki-p4-spot11-1.jpg" },
   { io: File.open(Rails.root.join("db/fixtures/tabisuki-p4-spot11-2.jpg")), filename: "tabisuki-p4-spot11-2.jpg" },
   { io: File.open(Rails.root.join("db/fixtures/tabisuki-p4-spot11-3.jpg")), filename: "tabisuki-p4-spot11-3.jpg" }
  ])

  #スポット12（宇多須神社）
  spot12 = plan.spots.build(
    name: "宇多須神社",
    explanation: "nil",
    visit_order: 12,
    address: "石川県金沢市東山1-30-8",
    staying_start: DateTime.new(2024,11,2,15,30),
    staying_end:   DateTime.new(2024,11,2,16,00)
  )
  
  spot12.images.attach([
   { io: File.open(Rails.root.join("db/fixtures/tabisuki-p4-spot12-1.jpg")), filename: "tabisuki-p4-spot12-1.jpg" }
  ])

  #スポット13（小坂神社）
  spot13 = plan.spots.build(
    name: "小坂神社",
    explanation: "nil",
    visit_order: 13,
    address: "石川県金沢市山の上町42-1",
    staying_start: DateTime.new(2024,11,2,16,15),
    staying_end:   DateTime.new(2024,11,2,16,45)
  )
  
  spot13.images.attach([
   { io: File.open(Rails.root.join("db/fixtures/tabisuki-p4-spot13-1.jpg")), filename: "tabisuki-p4-spot13-1.jpg" }
  ])

  #spot1にルートをネスト（金沢駅→石浦神社）
  spot1.routes.build(
    departure: "JR金沢駅バスターミナル",
    arrival: "香林坊（アトリオ前）",
    travel_time: 10,
    transportation: 2, #バス
    description: "東口と西口それぞれから香林坊（アトリオ前）へいくバスあり!!",
    visit_order:1
  )
  spot1.routes.build(
    departure: "香林坊（アトリオ前）",
    arrival: "石浦神社",
    travel_time: 5,
    transportation: 0, #徒歩
    description: "nil",
    visit_order: 2
  )

  #spot2にルートをネスト（石浦神社→お食事処　堤亭）
  spot2.routes.build(
    departure: "石浦神社",
    arrival: "お食事処 堤亭",
    travel_time: 7,
    transportation: 0, #徒歩
    description: "nil",
    visit_order: 3
  )

  #spot3にルートをネスト（お食事処　堤亭→兼六園）
  spot3.routes.build(
    departure: "お食事処 堤亭",
    arrival: "兼六園",
    travel_time: 1,
    transportation: 0, #徒歩
    visit_order: 4
  )

  #spot4にルートをネスト（兼六園→金澤神社）
  spot4.routes.build(
    departure: "兼六園",
    arrival: "金澤神社",
    travel_time: 1,
    transportation: 0, # 徒歩
    description: "nil",
    visit_order: 5
  )

  #spot5にルートをネスト（金澤神社→金沢城公園）
  spot5.routes.build(
    departure: "金澤神社",
    arrival: "金沢城公園",
    travel_time: 15,
    transportation: 0, #徒歩
    description: "nil",
    visit_order: 5
  )

  #spot6にルートをネスト（金沢城公園→尾山神社）
  spot6.routes.build(
    departure: "金沢城公園",
    arrival: "尾山神社",
    travel_time: 15,
    transportation: 0, #徒歩
    description: "nil",
    visit_order: 6
  )

  #spot7にルートをネスト（尾山神社→夕食）
  spot7.routes.build(
    departure: "尾山神社",
    arrival: "廻る富山湾 すし玉",
    travel_time: 15,
    transportation: 0, #徒歩
    description: "nil",
    visit_order:8
  )

  #spot8にルートをネスト（夕食→ホテル）
  spot8.routes.build(
    departure: "廻る富山湾 すし玉",
    arrival: "ホテルマイステイズ金沢キャッスル",
    travel_time: 10,
    transportation: 0, #徒歩
    description: "nil",
    visit_order: 10
  )

  #spot9にルートをネスト（ホテル→安江八幡宮）
  spot9.routes.build(
    departure: "ホテルマイステイズ金沢キャッスル",
    arrival: "安江八幡宮",
    travel_time: 1,
    transportation: 0, #徒歩
    description: "nil",
    visit_order: 11
  )

  #spot10にルートをネスト（安江八幡宮→兎橋神社 ）
  spot10.routes.build(
    departure: "安江八幡宮",
    arrival: "金沢駅",
    travel_time: 8,
    transportation: 0, #徒歩
    description: "nil",
    visit_order: 11
  )

  spot10.routes.build(
    departure: "金沢駅",
    arrival: "小松駅",
    travel_time: 34,
    transportation: 1, #電車
    description: "nil",
    visit_order: 12
  )

  spot10.routes.build(
    departure: "小松駅",
    arrival: "兎橋神社",
    travel_time: 15,
    transportation: 0, #徒歩
    description: "nil",
    visit_order: 13
  )

  #spot11 にルートをネスト（兎橋神社→ひがし茶屋街 ）
  spot11.routes.build(
    departure: "兎橋神社",
    arrival: "小松駅",
    travel_time: 15,
    transportation: 0, #徒歩
    description: "nil",
    visit_order: 14
  )

  spot11.routes.build(
    departure: "小松駅",
    arrival: "金沢駅",
    travel_time: 34,
    transportation:1, #電車
    description: "nil",
    visit_order: 15
  )

  spot11.routes.build(
    departure: "金沢駅",
    arrival: "ひがし茶屋街",
    travel_time: 15,
    transportation: 2, #バス
    description: "nil",
    visit_order: 16
  )

  #spot12 にルートをネスト（ひがし茶屋街→宇多須神社）
  spot12.routes.build(
    departure: "ひがし茶屋街",
    arrival: "宇多須神社",
    travel_time: 6,
    transportation: 0, #徒歩
    description: "nil",
    visit_order: 17
  )

  #spot13 にルートをネスト（宇多須神社→小坂神社）
  spot13.routes.build(
    departure: "宇多須神社",
    arrival: "小坂神社",
    travel_time: 16,
    transportation: 0, #徒歩
    description: "nil",
    visit_order: 14
  )

end

#旅好きママさんプラン1
Plan.find_or_create_by!(title: "三重旅行") do |plan|
  plan.start_date = Date.new(2024,8,1)
  plan.end_date = Date.new(2024,8,3)
  plan.body = "子どもと一緒に夏休みの旅行に行きました♫"
  plan.user = mama
  
end


  #スポット1（伊勢シーパラダイス）

  spot1 = plan2.spots.create!(
    name: "伊勢シーパラダイス",
    explanation: "距離感がすごく近い水族館！ふれあいの多さに子どもも大喜び！じっくり回って大満足です！",
    visit_order: 1,
    address: "三重県伊勢市二見町江580",
    staying_start: DateTime.new(2024,8,1,12,0),
    staying_end:   DateTime.new(2025,8,1,15,0)
  )

  spot1.images.attach([
    { io: File.open(Rails.root.join("db/fixtures/mama-p1-spot1-1.jpg")), filename: "mama-p1-spot1-1.jpg" },
    { io: File.open(Rails.root.join("db/fixtures/mama-p1-spot1-2.jpg")), filename: "mama-p1-spot1-2.jpg" },    
   ])

  # スポット2(宿泊)
  spot2 = plan2.spots.create!(
    name: "ホテル志摩スペイン村",
    explanation: "志摩スペイン村”公式ホテルに宿泊！",
    visit_order: 2,
    address: "三重県志摩市磯部町坂崎",
    staying_start: DateTime.new(2024,8,1,17,0),
    staying_end:   DateTime.new(2024,8,3,10,0)
  )

  # スポット3（志摩スペイン村）
  spot3 = plan2.spots.create!(
    name: "志摩スペイン村",
    explanation: "一日中志摩スペイン村を堪能！アトラクションもたくさん乗って楽しかったみたい！",
    visit_order: 3,
    address: "三重県志摩市磯部町坂崎字下山952-4",
    staying_start: DateTime.new(2024,8,2,9,0),
    staying_end:   DateTime.new(2024,8,2,20,0)
  )

  spot3.images.attach([
    { io: File.open(Rails.root.join("db/fixtures/mama-p1-spot3-1.jpg")), filename: "mama-p1-spot3-1.jpg" },
    { io: File.open(Rails.root.join("db/fixtures/mama-p1-spot3-2.jpg")), filename: "mama-p1-spot3-2.jpg" },
    { io: File.open(Rails.root.join("db/fixtures/mama-p1-spot3-3.jpg")), filename: "mama-p1-spot3-3.jpg" }    
   ])


  # スポット4（鳥羽湾クルーズ）
  spot4 = plan2.spots.create!(
    name: "鳥羽湾めぐりとイルカ島",
    explanation: "普段のることのない大きい船に乗ってイルカのいる島へ！",
    visit_order: 4,
    address: "三重県鳥羽市鳥羽1丁目2383番地51",
    staying_start: DateTime.new(2024,8,3,10,0),
    staying_end:   DateTime.new(2024,8,3,12,0)
  )

  # スポット5（鳥羽水族館）
  spot5 = plan2.spots.create!(
    name: "鳥羽水族館",
    explanation: "ジュゴンに会える水族館！",
    visit_order: 5,
    address: "三重県鳥羽市鳥羽3-3-6",
    staying_start: DateTime.new(2024,8,3,13,10),
    staying_end:   DateTime.new(2024,8,3,16,00)
  )

  spot5.images.attach([
    { io: File.open(Rails.root.join("db/fixtures/mama-p1-spot5-1.jpg")), filename: "mama-p1-spot5-1.jpg" },
    { io: File.open(Rails.root.join("db/fixtures/mama-p1-spot5-2.jpg")), filename: "mama-p1-spot5-2.jpg" },
    { io: File.open(Rails.root.join("db/fixtures/mama-p1-spot5-3.jpg")), filename: "mama-p1-spot5-3.jpg" }    
   ])

  # spot1 にルートをネスト（鳥羽駅 → 伊勢シーパラダイス）
  spot1.routes.create!(
    departure: "鳥羽駅",
    arrival: "夫婦岩東口",
    travel_time: 15,
    transportation: 2, #バス
    description: nil,
    visit_order: 1
  )

  # spot2 にルートをネスト（ 伊勢シーパラダイス→鳥羽駅）
  spot2.routes.create!(
    departure: "夫婦岩東口",
    arrival: "鳥羽駅",
    travel_time: 15,
    transportation: 2, # バス
    description: nil,
    visit_order: 2
  )
    
  # spot2（ 鳥羽駅→鵜方駅）
  spot2.routes.create!(
    departure: "鳥羽駅",
    arrival: "鵜方駅",
    travel_time: 25,
    transportation: 1, # 電車
    description: nil,
    visit_order: 3
  )

  # spot2（ 鵜方駅→ホテル）
  spot2.routes.create!(
    departure: "鵜方駅",
    arrival: "ホテル志摩スペイン村",
    travel_time: 10,
    transportation: 2, # バス
    description: nil,
    visit_order: 4
  )


  # spot4 にルートをネスト（ホテル志摩スペイン村→鵜方駅）
  spot4.routes.create!(
    departure: "ホテル志摩スペイン村",
    arrival: "鵜方駅",
    travel_time: 10,
    transportation: 2, # バス
    description: nil,
    visit_order: 5
  )

  # spot4 にルートをネスト（鵜方駅→鳥羽駅）
  spot4.routes.create!(
    departure: "鵜方駅",
    arrival: "鳥羽駅",
    travel_time: 15,
    transportation: 1, #電車
    description: nil,
    visit_order: 6
  )
  spot4.routes.create!(
    departure: "鳥羽駅",
    arrival: "鳥羽マリンターミナル",
    travel_time: 10,
    transportation: 0, #徒歩
    description: nil,
    visit_order: 7
  )

  # spot5にルートをネスト（真珠島・水族館のりば→鳥羽水族館）
  spot5.routes.create!(
    departure: "真珠島・水族館のりば",
    arrival: "鳥羽水族館",
    travel_time: 1,
    transportation: 0, #徒歩
    description: nil,
    visit_order: 8
  )
end

#旅好きママさんプラン2
Plan.find_or_create_by!(title: "白浜旅行") do |plan|
  plan.start_date = Date.new(2024,8,3)
  plan.end_date = Date.new(2024,8,4)
  plan.body = "今年の夏休み旅行は白浜に行きました♫ 白浜駅にてレンタカーをしてスタート！"
  plan.user = mama

  #スポット１（とれとれ市場）
  spot1 = plan.spots.build(
    name: "とれとれ市場",
    explanation: "自分で食べたいものを少しずつ食べることができて最高でした!!次は海鮮BBQもしてみたいな♫",
    visit_order: 1,
    address: "和歌山県西牟婁郡白浜町堅田2521",
    staying_start: DateTime.new(2024,8,3,11,00),
    staying_end:   DateTime.new(2024,8,3,12,30)
  )
  spot1.images.attach([
    { io: File.open(Rails.root.join("db/fixtures/mama-p2-spot1-1.jpg")), filename: "mama-p2-spot1-1.jpg" },
    { io: File.open(Rails.root.join("db/fixtures/mama-p2-spot1-2.jpg")), filename: "mama-p2-spot1-2.jpg" },    
  ])

  #スポット2(白良浜)
  spot2 = plan.spots.build(
    name: "白良浜",
    explanation: "子供達の希望の海水浴！海も綺麗で満喫しました！",
    visit_order: 2,
    address: "和歌山県西牟婁郡白浜町864",
    staying_start: DateTime.new(2024,8,3,12,40),
    staying_end:   DateTime.new(2024,8,3,16,00)
  )
  spot2.images.attach([
    { io: File.open(Rails.root.join("db/fixtures/mama-p2-spot2-1.jpg")), filename: "mama-p2-spot2-1.jpg" },    
  ])

  #スポット3(宿泊)
  spot3 = plan.spots.build(
    name: "浜千鳥の湯海舟",
    explanation: "ゆったりとした時間の流れを感じられるお宿でした♫",
    visit_order: 3,
    address: "和歌山県西牟婁郡白浜町864",
    staying_start: DateTime.new(2024,8,3,16,00),
    staying_end:   DateTime.new(2024,8,4,10,00)
  )
  spot3.images.attach([
    { io: File.open(Rails.root.join("db/fixtures/mama-p2-spot3-1.jpg")), filename: "mama-p2-spot3-1.jpg" },
    { io: File.open(Rails.root.join("db/fixtures/mama-p2-spot3-2.jpg")), filename: "mama-p2-spot3-2.jpg" },    
    { io: File.open(Rails.root.join("db/fixtures/mama-p2-spot3-3.jpg")), filename: "mama-p2-spot3-3.jpg" },    
    { io: File.open(Rails.root.join("db/fixtures/mama-p2-spot3-4.jpg")), filename: "mama-p2-spot3-4.jpg" },    
    { io: File.open(Rails.root.join("db/fixtures/mama-p2-spot3-5.jpg")), filename: "mama-p2-spot3-5.jpg" }    
  ])

  #スポット4(アドベンチャーワールド)
  spot4 = plan.spots.build(
    name: "アドベンチャーワールド",
    explanation: "nil",
    visit_order: 4,
    address: "和歌山県西牟婁郡白浜町堅田2399",
    staying_start: DateTime.new(2024,8,4,10,00),
    staying_end:   DateTime.new(2024,8,4,16,00)
  )

  spot4.images.attach([
    { io: File.open(Rails.root.join("db/fixtures/mama-p2-spot4-1.jpg")), filename: "mama-p2-spot4-1.jpg" },
    { io: File.open(Rails.root.join("db/fixtures/mama-p2-spot4-2.jpg")), filename: "mama-p2-spot4-2.jpg" },    
    { io: File.open(Rails.root.join("db/fixtures/mama-p2-spot4-3.jpg")), filename: "mama-p2-spot4-3.jpg" },    
    { io: File.open(Rails.root.join("db/fixtures/mama-p2-spot4-4.jpg")), filename: "mama-p2-spot4-4.jpg" },    
    { io: File.open(Rails.root.join("db/fixtures/mama-p2-spot4-5.jpg")), filename: "mama-p2-spot4-5.jpg" }    
  ])

  #スポット5(とれとれの湯)
  spot5 = plan.spots.build(
    name: "とれとれの湯",
    explanation: "nil",
    visit_order: 5,
    address: "和歌山県西牟婁郡白浜町堅田2508",
    staying_start: DateTime.new(2024,8,4,16,10),
    staying_end:   DateTime.new(2024,8,4,17,40)
  )

  #spot1 にルートをネスト（白浜駅 →とれとれ市場）
  spot1.routes.build(
    departure: "白浜駅",
    arrival: "とれとれ市場",
    travel_time: 5,
    transportation: 3, #車
    description: "nil",
    visit_order: 1
  )

  #spot2 にルートをネスト（とれとれ市場→白良浜 ）
  spot2.routes.build(
    departure: "とれとれ市場",
    arrival: "白良浜",
    travel_time: 7,
    transportation: 3, #車
    description: "nil",
    visit_order: 2
  )

  # spot3 にルートをネスト（白良浜→旅館 ）
  spot3.routes.build(
    departure: "白良浜",
    arrival: "浜千鳥の湯 海舟",
    travel_time: 4,
    transportation: 3, #車
    description: "nil",
    visit_order: 3
  )

  # spot4 にルートをネスト（旅館→アドベンチャーワールド ）
  spot4.routes.build(
    departure: "浜千鳥の湯 海舟",
    arrival: "アドベンチャーワールド",
    travel_time: 12,
    transportation: 3, #車
    description: "nil",
    visit_order: 4
  )

  # spot5 にルートをネスト（アドベンチャーワールド→とれとれの湯 ）
  spot5.routes.build(
    departure: "アドベンチャーワールド",
    arrival: "とれとれの湯",
    travel_time: 6,
    transportation: 3, #車
    description: "nil",
    visit_order: 5
  )
end

#恋するカップルプラン1
Plan.find_or_create_by!(title: "日帰り高知") do |plan|
  plan.start_date = Date.new(2023, 9,19)
  plan.end_date = Date.new(2023,9,19)
  plan.body = "カツオを食べに高知へ♫"
  plan.user = couple

  #スポット1(高知城)
  spot1 = plan.spots.build(
    name: "高知城",
    explanation: "nil",
    visit_order: 1,
    address: "高知県高知市丸ノ内1-2-1",
    staying_start: DateTime.new(2023,9,19,10,30),
    staying_end:   DateTime.new(2023,9,19,11,30)
  )
  spot1.images.attach([
   { io: File.open(Rails.root.join("db/fixtures/couple-p1-spot1-1.jpg")), filename: "couple-p1-spot1-1.jpg" },
   { io: File.open(Rails.root.join("db/fixtures/couple-p1-spot1-2.jpg")), filename: "couple-p1-spot1-2.jpg" }
  ])

  #スポット2(ひろめ市場)
  spot2 = plan.spots.build(
    name: "ひろめ市場",
    explanation: "nil",
    visit_order: 2,
    address: "高知県高知市帯屋町2-3-1",
    staying_start: DateTime.new(2023,9,19,11,40),
    staying_end:   DateTime.new(2023,9,19,13,30)
  )
  spot2.images.attach([
   { io: File.open(Rails.root.join("db/fixtures/couple-p1-spot2-1.jpg")), filename: "couple-p1-spot2-1.jpg" },
   { io: File.open(Rails.root.join("db/fixtures/couple-p1-spot2-2.jpg")), filename: "couple-p1-spot2-2.jpg" },
   { io: File.open(Rails.root.join("db/fixtures/couple-p1-spot2-2.jpg")), filename: "couple-p1-spot2-2.jpg" }
  ])

  #スポット3(桂浜)
  spot3 = plan.spots.build(
    name: "桂浜",
    explanation: "nil",
    visit_order: 3,
    address: "高知県高知市南はりまや町1-2",
    staying_start: DateTime.new(2023,9,19,14,50),
    staying_end:   DateTime.new(2023,9,19,16,50)
  )
  spot3.images.attach([
   { io: File.open(Rails.root.join("db/fixtures/couple-p1-spot3-1.jpg")), filename: "couple-p1-spot3-1.jpg" },
   { io: File.open(Rails.root.join("db/fixtures/couple-p1-spot3-2.jpg")), filename: "couple-p1-spot3-2.jpg" },
   { io: File.open(Rails.root.join("db/fixtures/couple-p1-spot3-2.jpg")), filename: "couple-p1-spot3-2.jpg" }
  ])


  #スポット4(桂浜水族館)
  spot4 = plan.spots.build(
    name: "はりまや橋",
    explanation: "nil",
    visit_order: 4,
    address: "高知県高知市南はりまや町1-2",
    staying_start: DateTime.new(2023,9,19,14,50),
    staying_end:   DateTime.new(2023,9,19,16,50)
  )
  spot4.images.attach([
   { io: File.open(Rails.root.join("db/fixtures/couple-p1-spot4-1.jpg")), filename: "couple-p1-spot4-1.jpg" },
   { io: File.open(Rails.root.join("db/fixtures/couple-p1-spot4-2.jpg")), filename: "couple-p1-spot4-2.jpg" },
  ])


  #スポット5(はりまや橋)
  spot5 = plan.spots.build(
    name: "はりまや橋",
    explanation: "nil",
    visit_order: 5,
    address: "高知県高知市南はりまや町1-2",
    staying_start: DateTime.new(2023,09,19,14,50),
    staying_end:   DateTime.new(2023,09,19,16,50)
  )
  spot5.images.attach([
   { io: File.open(Rails.root.join("db/fixtures/couple-p1-spot5-1.jpg")), filename: "couple-p1-spot5-1.jpg" },
   { io: File.open(Rails.root.join("db/fixtures/couple-p1-spot5-2.jpg")), filename: "couple-p1-spot5-2.jpg" },
   { io: File.open(Rails.root.join("db/fixtures/couple-p1-spot5-2.jpg")), filename: "couple-p1-spot5-2.jpg" }
  ])

  # spot1 にルートをネスト（高知駅→高知城）
  spot1.routes.build(
    departure: "高知駅",
    arrival: "高知城",
    travel_time: 25,
    transportation: 0, #徒歩
    description: "nil",
    visit_order: 1
  )

  # spot2 にルートをネスト（高知城→ひろめ市場）
  spot2.routes.build(
    departure: "高知城",
    arrival: "ひろめ市場",
    travel_time: 10,
    transportation: 0, #徒歩
    description: "nil",
    visit_order: 2
  )

  # spot3 にルートをネスト（ひろめ市場→桂浜）
  spot3.routes.build(
    departure: "ひろめ市場",
    arrival: "南はりまや橋",
    travel_time: 13,
    transportation: 2, #バス
    description: "nil",
    visit_order: 3
  )

  # spot4にルートをネスト（桂浜→桂浜水族館）
  spot4.routes.build(
    departure: "桂浜",
    arrival: "桂浜水族館",
    travel_time: 5,
    transportation: 0, #徒歩
    description: "nil",
    visit_order: 4
  )


  # spot5にルートをネスト（桂浜水族館→はりまや橋）
  spot5.routes.build(
    departure: "桂浜",
    arrival: "北はりまや橋",
    travel_time: 30,
    transportation: 0, #徒歩
    description: "nil",
    visit_order: 5
  )

  spot5.routes.build(
    departure: "北はりまや橋",
    arrival: "はりまや橋",
    travel_time: 30,
    transportation: 0, #徒歩
    description: "nil",
    visit_order: 5
  )
end

#恋するカップルプラン2
Plan.find_or_create_by!(title: "城崎温泉") do |plan|
  plan.start_date = Date.new(2024,1,14)
  plan.end_date = Date.new(2024,1,15)
  plan.body = "温泉＆カニ最高でした！！駅についたらすぐ温泉街でお土産やさんもカフェもありよかったです！"
  plan.user = couple

  #スポット1(昼食)
    spot1 = plan.spots.build(
    name: "おけしょう鮮魚の海中苑 本店",
    explanation: "nil",
    visit_order: 1,
    address: "兵庫県豊岡市城崎町湯島132",
    staying_start: DateTime.new(2024,1,14,11,30),
    staying_end:   DateTime.new(2024,1,14,12,30)
  )
  spot1.images.attach([
   { io: File.open(Rails.root.join("db/fixtures/couple-p2-spot1-1.jpg")), filename: "couple-p2-spot1-1.jpg" },
   { io: File.open(Rails.root.join("db/fixtures/couple-p2-spot1-2.jpg")), filename: "couple-p2-spot1-2.jpg" }
  ])

  #スポット2(城崎プリンkiman生萬)
  spot2 = plan.spots.build(
    name: "城崎プリンkiman生萬",
    explanation: "nil",
    visit_order: 2,
    address: "兵庫県豊岡市城崎町湯島267",
    staying_start: DateTime.new(2024,1,14,12,40),
    staying_end:   DateTime.new(2024,1,14,14,00)
  )
  spot2.images.attach([
   { io: File.open(Rails.root.join("db/fixtures/couple-p2-spot2-1.jpg")), filename: "couple-p2-spot2-1.jpg" }
  ])

  #スポット3(旅館)
  spot3 = plan.spots.build(
    name: "但馬屋",
    explanation: "nil",
    visit_order: 3,
    address: "兵庫県豊岡市城崎町湯島453",
    staying_start: DateTime.new(2024,1,14,15,00),
    staying_end:   DateTime.new(2024,1,15,10,00)
  )
  spot3.images.attach([
   { io: File.open(Rails.root.join("db/fixtures/couple-p2-spot3-1.jpg")), filename: "couple-p2-spot3-1.jpg" },
   { io: File.open(Rails.root.join("db/fixtures/couple-p2-spot3-2.jpg")), filename: "couple-p2-spot3-2.jpg" },
   { io: File.open(Rails.root.join("db/fixtures/couple-p2-spot3-3.jpg")), filename: "couple-p2-spot3-3.jpg" },
   { io: File.open(Rails.root.join("db/fixtures/couple-p2-spot3-4.jpg")), filename: "couple-p2-spot3-4.jpg" }
  ])

  #スポット4(湯めぐり)
  spot4 = plan.spots.build(
    name: "湯めぐり",
    explanation: "nil",
    visit_order: 4,
    address: "兵庫県豊岡市城崎町湯島448",
    staying_start: DateTime.new(2024,1,14,15,00),
    staying_end:   DateTime.new(2024,1,15,11,00)
  )
  spot4.images.attach([
   { io: File.open(Rails.root.join("db/fixtures/couple-p2-spot4-1.jpg")), filename: "couple-p2-spot4-1.jpg" },
   { io: File.open(Rails.root.join("db/fixtures/couple-p2-spot4-2.jpg")), filename: "couple-p2-spot4-2.jpg" },
   { io: File.open(Rails.root.join("db/fixtures/couple-p2-spot4-3.jpg")), filename: "couple-p2-spot4-3.jpg" },
   { io: File.open(Rails.root.join("db/fixtures/couple-p2-spot4-4.jpg")), filename: "couple-p2-spot4-4.jpg" },
   { io: File.open(Rails.root.join("db/fixtures/couple-p2-spot4-5.jpg")), filename: "couple-p2-spot4-5.jpg" }

  ])

  #スポット5(城崎マリンワールド)
  spot5 = plan.spots.build(
    name: "城崎マリンワールド",
    explanation: "アジ釣りをしてそのまま天ぷらにしていただきました！美味しかった〜！",
    visit_order: 10,
    address: "兵庫県豊岡市瀬戸1090",
    staying_start: DateTime.new(2024,1,15,11,10),
    staying_end:   DateTime.new(2024,1,15,15,45)
  )
  spot5.images.attach([
   { io: File.open(Rails.root.join("db/fixtures/couple-p2-spot5-1.jpg")), filename: "couple-p2-spot5-1.jpg" },
   { io: File.open(Rails.root.join("db/fixtures/couple-p2-spot5-2.jpg")), filename: "couple-p2-spot5-2.jpg" },
   { io: File.open(Rails.root.join("db/fixtures/couple-p2-spot5-3.jpg")), filename: "couple-p2-spot5-3.jpg" }
  ])
 
  # spot5にルートをネスト（城崎温泉→城崎マリンワールド）
  spot5.routes.build(
    departure: "城崎温泉駅",
    arrival: "城崎マリンワールド",
    travel_time: 10,
    transportation: 2, #バス
    description: "nil",
    visit_order: 1
  )
end

#ほのぼのさんプラン1
Plan.find_or_create_by!(title: "雪景色城崎") do |plan|
  plan.start_date = Date.new(2024,1,24)
  plan.end_date = Date.new(2024,1,25)
  plan.body = "かなり寒い日だったので雪景色を見ることができました！"
  plan.user = honobono

  #スポット1(ランチ)
  spot1 = plan.spots.build(
    name: "城崎町家地ビールレストランGUBIGABU",
    explanation: "街並みを見ながら楽しめる席もあり、素敵なお店でした♫",
    visit_order: 1,
    address: "兵庫県豊岡市城崎湯島646",
    staying_start: DateTime.new(2024,1,24,11,00),
    staying_end:   DateTime.new(2024,1,24,12,00)
  )
  spot1.images.attach([
   { io: File.open(Rails.root.join("db/fixtures/honobono-p1-spot1-1.jpg")), filename: "honobono-p1-spot1-1.jpg" },
   { io: File.open(Rails.root.join("db/fixtures/honobono-p1-spot1-2.jpg")), filename: "honobono-p1-spot1-2.jpg" }
  ])

  #スポット2(ロープウェイ)
  spot2 = plan.spots.build(
    name: "城崎温泉ロープウェイ",
    explanation: "温泉街を上から見渡す景色がよかったです！",
    visit_order: 2,
    address: "兵庫県豊岡市城崎湯島806-1",
    staying_start: DateTime.new(2024,1,24,12,15),
    staying_end:   DateTime.new(2024,1,24,14,00)
  )

  spot2.images.attach([
   { io: File.open(Rails.root.join("db/fixtures/honobono-p1-spot2-1.jpg")), filename: "honobono-p1-spot2-1.jpg" },
   { io: File.open(Rails.root.join("db/fixtures/honobono-p1-spot2-2.jpg")), filename: "honobono-p1-spot2-2.jpg" }
  ])
 
  #スポット3(カフェ)
  spot3 = plan.spots.build(
    name: "城崎珈琲みはらしテラスカフェ",
    explanation: "テラス席もあり、のんびり景色を楽しめました！",
    visit_order: 3,
    address: "兵庫県豊岡市城崎湯島806-1",
    staying_start: DateTime.new(2024,1,24,13,00),
    staying_end:   DateTime.new(2024,1,24,13,45)
  )
  
  spot3.images.attach([
    { io: File.open(Rails.root.join("db/fixtures/honobono-p1-spot3-1.jpg")), filename: "honobono-p1-spot3-1.jpg" }
  ])
  
  #スポット4(宿泊)
  spot4 = plan.spots.build(
    name: "但馬屋",
    explanation: "雪が積もっていたので外湯巡って最後に旅館の貸切風呂で締めました！",
    visit_order: 4,
    address: "兵庫県豊岡市城崎町湯島453",
    staying_start: DateTime.new(2024,1,24,15,00),
    staying_end:   DateTime.new(2024,1,25,10,00)
  )

  #スポット5(湯めぐり)
  spot5 = plan.spots.build(
    name: "湯めぐり",
    explanation: "のんびり街並みを楽しみながら湯めぐり！チェックイン時旅館でいただいた外湯めぐりパスで次の日もゆっくり温泉が楽しめた！雪景色なかなか見れないからいい思い出になりました！",
    visit_order: 5,
    address: "兵庫県豊岡市城崎町湯島448",
    staying_start: DateTime.new(2024,1,24,15,00),
    staying_end:   DateTime.new(2024,1,25,14,00)
  )
  
  spot5.images.attach([
    { io: File.open(Rails.root.join("db/fixtures/honobono-p1-spot5-1.jpg")), filename: "honobono-p1-spot5-1.jpg" },
    { io: File.open(Rails.root.join("db/fixtures/honobono-p1-spot5-2.jpg")), filename: "honobono-p1-spot5-2.jpg" },
    { io: File.open(Rails.root.join("db/fixtures/honobono-p1-spot5-3.jpg")), filename: "honobono-p1-spot5-3.jpg" },
    { io: File.open(Rails.root.join("db/fixtures/honobono-p1-spot5-4.jpg")), filename: "honobono-p1-spot5-4.jpg" },
    { io: File.open(Rails.root.join("db/fixtures/honobono-p1-spot5-5.jpg")), filename: "honobono-p1-spot5-5.jpg" },
    { io: File.open(Rails.root.join("db/fixtures/honobono-p1-spot5-6.jpg")), filename: "honobono-p1-spot5-6.jpg" },
    { io: File.open(Rails.root.join("db/fixtures/honobono-p1-spot5-7.jpg")), filename: "honobono-p1-spot5-7.jpg" },
    { io: File.open(Rails.root.join("db/fixtures/honobono-p1-spot5-8.jpg")), filename: "honobono-p1-spot5-8.jpg" }
  ])
  
  #スポット6(カフェ)
  spot6 = plan.spots.build(
    name: "短編喫茶Un",
    explanation: "ブックカフェ！生バターどら焼きが美味しかった！",
    visit_order: 36
    address: "兵庫県豊岡市城崎湯島127",
    staying_start: DateTime.new(2024,01,25,14,10),
    staying_end:   DateTime.new(2024,01,25,15,00)
  )

  spot6.images.attach([
   { io: File.open(Rails.root.join("db/fixtures/honobono-p1-spot6-1.jpg")), filename: "honobono-p1-spot6-1.jpg" },
   { io: File.open(Rails.root.join("db/fixtures/honobono-p1-spot6-2.jpg")), filename: "honobono-p1-spot6-2.jpg" }
  ])

  #スポット7(ご飯)
  spot7 = plan.spots.build(
    name: "おけしょう鮮魚の海中苑 駅前店",
    explanation: "nil",
    visit_order: 1,
    address: "兵庫県豊岡市城崎町湯島88",
    staying_start: DateTime.new(2024,1,25,16,00),
    staying_end:   DateTime.new(2024,1,25,17,30)
  )

  spot7.images.attach([
   { io: File.open(Rails.root.join("db/fixtures/honobono-p1-spot7-1.jpg")), filename: "honobono-p1-spot7-1.jpg" },
   { io: File.open(Rails.root.join("db/fixtures/honobono-p1-spot7-2.jpg")), filename: "honobono-p1-spot7-2.jpg" }
  ])

end

