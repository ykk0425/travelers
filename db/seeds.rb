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

